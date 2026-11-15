import '../hoosat/hoosat.dart';
import '../hoosat/transaction/compound_grouping.dart';
import '../hoosat/transaction/types.dart';
import '../utxos/utxos_providers.dart';

enum CompoundSituation {
  /// There is something to merge right now.
  ready,

  /// Coins exist that could be merged, but some are still too new to spend.
  maturing,

  /// The wallet already has a healthy handful of coins: merging would undo it.
  healthy,

  /// Nothing to merge (each address holds a single coin).
  nothing,
}

class CompoundAdvice {
  final CompoundSituation situation;

  /// Plain words for the person, shown in the dialog.
  final String message;
  final int transactions;
  final int coinsToMerge;

  /// Total network fee, in sompi.
  final BigInt fee;

  CompoundAdvice(
    this.situation,
    this.message, {
    this.transactions = 0,
    this.coinsToMerge = 0,
    BigInt? fee,
  }) : fee = fee ?? BigInt.zero;

  bool get canCompound => situation == CompoundSituation.ready;
}

String _htn(BigInt sompi) {
  final whole = sompi ~/ kSompiPerHoosat;
  final frac = (sompi % kSompiPerHoosat).toString().padLeft(8, '0');
  final trimmed = frac.replaceFirst(RegExp(r'0+$'), '');
  return trimmed.isEmpty ? '$whole' : '$whole.$trimmed';
}

/// Works out, in plain words, what Compound can do right now and why not.
///
/// Compound brings every group (Main, and each named account) down to about
/// [keepCoins] coins by merging only its SMALLEST coins; bigger coins and
/// groups already at or below the target are left alone.
///
/// [allCoins] is every coin in the wallet's list (including ones still
/// maturing); [spendable] only the ones that can be spent now.
CompoundAdvice adviseCompound({
  required List<Utxo> allCoins,
  required List<Utxo> spendable,
  required Set<String> accountAddresses,
  required BigInt score,
  required double daaPerSecond,
  int keepCoins = kCoinsToKeep,
}) {
  final plan = planCompound(
    allCoins: allCoins,
    spendable: spendable,
    accountAddresses: accountAddresses,
    keep: keepCoins,
  );

  if (plan.isNotEmpty) {
    final coins = plan.fold<int>(0, (n, c) => n + c.$2.length);
    final fee = BigInt.from(coins) * kFeePerInput;
    final wait = readyInWords(kMinUtxoMaturityDaaScore, daaPerSecond);
    return CompoundAdvice(
      CompoundSituation.ready,
      'This merges your $coins smallest coins in ${plan.length} '
      '${plan.length == 1 ? 'transaction' : 'transactions'}, leaving about '
      '$keepCoins coins per account. Bigger coins are left as they are. '
      'Network fee: about ${_htn(fee)} HTN. '
      'The merged coins can be spent in $wait.',
      transactions: plan.length,
      coinsToMerge: coins,
      fee: fee,
    );
  }

  final excess = totalExcessCoins(allCoins, accountAddresses, keepCoins);

  // Why not? Would more be possible once the newest coins are old enough?
  if (excess > 0) {
    final spendableKeys = {
      for (final u in spendable)
        '${u.outpoint.transactionId}:${u.outpoint.index}',
    };
    final notYet = allCoins
        .where((u) => !spendableKeys
            .contains('${u.outpoint.transactionId}:${u.outpoint.index}'))
        .toList();
    if (notYet.isNotEmpty &&
        planCompound(
          allCoins: allCoins,
          spendable: allCoins,
          accountAddresses: accountAddresses,
          keep: keepCoins,
        ).isNotEmpty) {
      final left = soonestMaturityUnits(notYet, score);
      final when =
          left == null ? 'a few minutes' : readyInWords(left, daaPerSecond);
      return CompoundAdvice(
        CompoundSituation.maturing,
        'Some of your coins are still too new to merge, or are busy with a '
        'recent payment. They can be merged in $when. Then press Compound again.',
      );
    }

    // Too many coins overall, but they sit on different addresses one each,
    // and coins are only ever merged within their own address.
    return CompoundAdvice(
      CompoundSituation.nothing,
      'Nothing can be merged: the extra coins are each on a different '
      'address, and coins are only merged within their own address.',
    );
  }

  if (allCoins.length > 1) {
    return CompoundAdvice(
      CompoundSituation.healthy,
      'Main and each account already have $keepCoins coins or fewer, so '
      'there is nothing to merge. The wallet keeps about $keepCoins spare '
      'coins per account so you can send several payments in a row.',
    );
  }

  return CompoundAdvice(
    CompoundSituation.nothing,
    'Nothing to merge: you only have a single coin.',
  );
}
