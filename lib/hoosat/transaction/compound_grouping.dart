import '../transaction/types.dart';

// ---------------------------------------------------------------------------
// Merge down to a healthy handful, smallest coins first
// ---------------------------------------------------------------------------

/// How many coins disappear when [merged] coins are merged, split across the
/// fewest transactions of at most [chunkSize] inputs (each transaction turns
/// its inputs into ONE coin).
int coinsRemovedBy(int merged, {int chunkSize = kMaxInputsPerTransaction}) {
  if (merged < 2) return 0;
  return merged - (merged / chunkSize).ceil();
}

/// The smallest number of coins that must be merged to remove [wanted] coins,
/// capped at [available].
int coinsToMergeToRemove(
  int wanted, {
  required int available,
  int chunkSize = kMaxInputsPerTransaction,
}) {
  if (wanted <= 0 || available < 2) return 0;
  var m = wanted + 1;
  while (m < available && coinsRemovedBy(m, chunkSize: chunkSize) < wanted) {
    m++;
  }
  return m > available ? available : m;
}

/// Coins are counted per GROUP: "main" is every address that is not a named
/// account, taken together; each named account is its own group. This is what
/// a payment draws from, so it is what the spare-coin target applies to.
String compoundGroupOf(String address, Set<String> accountAddresses) =>
    accountAddresses.contains(address) ? address : 'main';

/// A coin worth no more than the fee to move it. Merging it would cost more
/// than it holds, so it is left alone: it stays in the wallet and still counts
/// in the balance, it just is not part of the "about 10 coins" target.
bool isDustCoin(Utxo u) => u.utxoEntry.amount <= kFeePerInput;

/// How many coins, summed over all groups, are above the [keep] target.
/// Dust coins (see [isDustCoin]) are not counted: they are never merged.
int totalExcessCoins(
  Iterable<Utxo> allCoins,
  Set<String> accountAddresses,
  int keep,
) {
  final counts = <String, int>{};
  for (final u in allCoins.where((u) => !isDustCoin(u))) {
    counts.update(compoundGroupOf(u.address, accountAddresses), (n) => n + 1,
        ifAbsent: () => 1);
  }
  return counts.values.fold(0, (sum, n) => sum + (n > keep ? n - keep : 0));
}

/// Plans the merges that bring every group down to [keep] coins.
///
///  * [allCoins] is every coin (including ones still maturing) -- it decides
///    how many coins a group HAS;
///  * [spendable] is what may be merged right now;
///  * a group at or below [keep] is never touched;
///  * a group above it merges only its SMALLEST coins, just enough to land on
///    [keep] -- the large coins stay as they are;
///  * coins never move between addresses: each address merges into itself;
///  * each transaction takes at most [chunkSize] inputs, and the coins of one
///    address are spread evenly across its transactions.
///
/// Returns (address, coins to merge) pairs, one per transaction.
List<(String, List<Utxo>)> planCompound({
  required List<Utxo> allCoins,
  required List<Utxo> spendable,
  required Set<String> accountAddresses,
  int keep = kCoinsToKeep,
  int chunkSize = kMaxInputsPerTransaction,
}) {
  final groupCount = <String, int>{};
  for (final u in allCoins.where((u) => !isDustCoin(u))) {
    groupCount.update(compoundGroupOf(u.address, accountAddresses), (n) => n + 1,
        ifAbsent: () => 1);
  }

  // spendable coins per group per address, smallest first (never dust)
  final byGroup = <String, Map<String, List<Utxo>>>{};
  for (final u in spendable.where((u) => !isDustCoin(u))) {
    final g = compoundGroupOf(u.address, accountAddresses);
    byGroup.putIfAbsent(g, () => {}).putIfAbsent(u.address, () => []).add(u);
  }

  final plan = <(String, List<Utxo>)>[];
  // Main first, then the named accounts in a fixed order, so the same coins
  // always give the same plan.
  final groups = byGroup.entries.toList()
    ..sort((a, b) {
      if (a.key == 'main') return b.key == 'main' ? 0 : -1;
      if (b.key == 'main') return 1;
      return a.key.compareTo(b.key);
    });
  for (final entry in groups) {
    var excess = (groupCount[entry.key] ?? 0) - keep;
    if (excess <= 0) continue;

    // the address with the most mergeable coins goes first; ties are broken by
    // the address so the plan is the same every time it is made
    final addresses = entry.value.entries.toList()
      ..sort((a, b) {
        final c = b.value.length.compareTo(a.value.length);
        return c != 0 ? c : a.key.compareTo(b.key);
      });
    for (final a in addresses) {
      if (excess <= 0) break;
      final coins = List.of(a.value)
        ..sort((x, y) => x.utxoEntry.amount.compareTo(y.utxoEntry.amount));
      final m = coinsToMergeToRemove(
        excess < coins.length - 1 ? excess : coins.length - 1,
        available: coins.length,
        chunkSize: chunkSize,
      );
      if (m < 2) continue;
      final smallest = coins.take(m).toList();
      final txs = (m / chunkSize).ceil();
      // spread evenly so every transaction has at least 2 inputs
      var from = 0;
      for (var t = 0; t < txs; t++) {
        final size = m ~/ txs + (t < m % txs ? 1 : 0);
        plan.add((a.key, smallest.sublist(from, from + size)));
        from += size;
      }
      excess -= coinsRemovedBy(m, chunkSize: chunkSize);
    }
  }
  return plan;
}

// The previous planner, kept until the merge dialog moves to planCompound.
/// Groups [utxos] by their source address for self-compounding (each
/// address merges only its own utxos back into itself), then splits each
/// address's utxos into chunks of at most [chunkSize] (one transaction's
/// worth of inputs).
///
/// Addresses with fewer than 2 utxos are excluded -- a lone utxo has
/// nothing to merge with, so there's nothing to compound there.
///
/// Returns (address, chunk) pairs in a stable order: grouped by address
/// first (in the order addresses first appear in [utxos]), then by chunk
/// within that address.
List<(String, List<Utxo>)> groupUtxosForSelfCompound(
  List<Utxo> utxos, {
  int chunkSize = kMaxInputsPerTransaction,
}) {
  final byAddress = <String, List<Utxo>>{};
  for (final utxo in utxos) {
    byAddress.putIfAbsent(utxo.address, () => []).add(utxo);
  }

  final chunks = <(String, List<Utxo>)>[];
  for (final entry in byAddress.entries) {
    final address = entry.key;
    final addressUtxos = entry.value;
    if (addressUtxos.length < 2) {
      continue;
    }
    for (var i = 0; i < addressUtxos.length; i += chunkSize) {
      final end = (i + chunkSize) > addressUtxos.length
          ? addressUtxos.length
          : i + chunkSize;
      chunks.add((address, addressUtxos.sublist(i, end)));
    }
  }
  return chunks;
}
