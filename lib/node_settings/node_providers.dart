import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';
import '../hoosat/network.dart';
import 'node_pool_resolver.dart';
import 'node_settings_notifier.dart';
import 'node_types.dart';

final hoosatNodeSettingsProvider =
    StateNotifierProvider<NodeSettingsNotifier, NodeConfigSettings>((ref) {
  final repository = ref.watch(settingsRepositoryProvider);
  final notifier = NodeSettingsNotifier(repository);
  return notifier;
});

final hoosatNodeOptionsProvider = Provider((ref) {
  final settings = ref.watch(hoosatNodeSettingsProvider);
  return settings.options;
});

final hoosatNodeConfigProvider = Provider((ref) {
  final settings = ref.watch(hoosatNodeSettingsProvider);
  return ActiveNodeConfig(config: settings.selected);
});

final nodePoolResolverProvider = Provider((ref) => const NodePoolResolver());

/// For a DNS-pool-backed node config (isDns: true), resolves all A
/// records behind the configured hostname and picks the fastest healthy
/// (synced + UTXO-indexed) one, re-probing every 5 minutes. Yields null
/// for non-DNS configs, or if nothing in the pool answered in time --
/// callers should fall back to the configured url directly in that case.
final resolvedNodeHostProvider =
    StreamProvider.autoDispose<String?>((ref) async* {
  final config = ref.watch(hoosatNodeConfigProvider).config;
  final resolver = ref.watch(nodePoolResolverProvider);

  if (!config.isDns || config.urls.isEmpty) {
    yield null;
    return;
  }

  final components = config.urls.first.split(':');
  final hostname = components.first;
  final port = components.length > 1
      ? (int.tryParse(components.last) ?? kMainnetRpcPort)
      : kMainnetRpcPort;

  while (true) {
    final candidates = await resolver.resolveDnsPool(hostname);
    final best = await resolver.pickFastestNode(
      candidates,
      port: port,
      isSecure: config.isSecure,
    );
    yield best != null ? '$best:$port' : null;
    await Future.delayed(const Duration(minutes: 5));
  }
});
