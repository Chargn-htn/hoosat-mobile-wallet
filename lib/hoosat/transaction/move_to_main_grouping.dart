import '../transaction/types.dart';

/// The dust floor below which an address's balance isn't worth moving --
/// it couldn't even cover its own network fee. Matches Node Manager's
/// moveAllDustFloor (0.0001 HTN).
final BigInt moveToMainDustFloor = kSompiPerHoosat ~/ BigInt.from(10000);

/// Groups [utxos] by source address for a "move everything to Main" sweep:
/// every address other than [mainAddress] whose total balance exceeds
/// [dustFloor], chunked into [chunkSize]-utxo pieces (one per transaction).
///
/// Unlike self-compound, a single utxo is still worth moving (there's
/// nothing to merge, but there's still a balance to sweep), so addresses
/// aren't excluded just for having only one utxo -- only for being Main
/// itself or for being under the dust floor.
List<(String, List<Utxo>)> groupUtxosForMoveToMain(
  List<Utxo> utxos, {
  required String mainAddress,
  BigInt? dustFloor,
  int chunkSize = kMaxInputsPerTransaction,
}) {
  final floor = dustFloor ?? moveToMainDustFloor;

  final byAddress = <String, List<Utxo>>{};
  for (final utxo in utxos) {
    if (utxo.address == mainAddress) {
      continue;
    }
    byAddress.putIfAbsent(utxo.address, () => []).add(utxo);
  }

  final chunks = <(String, List<Utxo>)>[];
  for (final entry in byAddress.entries) {
    final address = entry.key;
    final addressUtxos = entry.value;
    final total = addressUtxos.fold<BigInt>(
      BigInt.zero,
      (sum, utxo) => sum + utxo.utxoEntry.amount,
    );
    if (total <= floor) {
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
