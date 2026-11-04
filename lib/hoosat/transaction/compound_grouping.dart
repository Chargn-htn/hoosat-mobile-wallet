import '../transaction/types.dart';

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
