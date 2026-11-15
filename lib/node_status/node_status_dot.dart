import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'connection_status.dart';
import 'node_test_dialog.dart';

/// Small status light for the node link: green (pulsing) = live updates,
/// amber = reconnecting, red = node not answering. Tap to run a connection
/// test.
class NodeStatusDot extends ConsumerStatefulWidget {
  const NodeStatusDot({super.key});

  @override
  ConsumerState<NodeStatusDot> createState() => _NodeStatusDotState();
}

class _NodeStatusDotState extends ConsumerState<NodeStatusDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1800),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  static Color _color(ConnectionStatus s) => switch (s) {
        ConnectionStatus.live => const Color(0xFF2ECC71),
        ConnectionStatus.reconnecting => const Color(0xFFF5A623),
        ConnectionStatus.unreachable => const Color(0xFFE74C3C),
      };

  static String _label(ConnectionStatus s) => switch (s) {
        ConnectionStatus.live => 'Node connected. Tap to test the connection.',
        ConnectionStatus.reconnecting =>
          'Reconnecting to the node. Tap to test the connection.',
        ConnectionStatus.unreachable =>
          'Node not answering. Tap to test the connection.',
      };

  @override
  Widget build(BuildContext context) {
    final status = ref.watch(connectionStatusProvider);
    final color = _color(status);

    return Semantics(
      button: true,
      label: _label(status),
      child: Tooltip(
        message: _label(status),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: () => showNodeTestDialog(context),
          child: SizedBox(
            width: 36,
            height: 36,
            child: Center(
              child: AnimatedBuilder(
                animation: _pulse,
                builder: (context, _) {
                  final glow = status == ConnectionStatus.live
                      ? 2.0 + 5.0 * _pulse.value
                      : 2.0;
                  return Container(
                    width: 11,
                    height: 11,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: color.withValues(alpha: 0.65),
                          blurRadius: glow,
                          spreadRadius: glow / 3,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
