import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../app_router.dart';
import '../widgets/app_simpledialog.dart';
import '../widgets/hs_kit.dart';
import 'connection_status.dart';
import 'node_test.dart';

Future<void> showNodeTestDialog(BuildContext context) {
  return showAppDialog(
    context: context,
    builder: (_) => const _NodeTestDialog(),
  );
}

class _NodeTestDialog extends ConsumerStatefulWidget {
  const _NodeTestDialog();

  @override
  ConsumerState<_NodeTestDialog> createState() => _NodeTestDialogState();
}

class _NodeTestDialogState extends ConsumerState<_NodeTestDialog> {
  NodeTestResult? _result;
  bool _running = false;
  int _runId = 0;

  @override
  void initState() {
    super.initState();
    Future.microtask(_run);
  }

  Future<void> _run() async {
    final id = ++_runId;
    final config = ref.read(hoosatNodeConfigProvider);
    final resolved = ref.read(resolvedNodeHostProvider).valueOrNull;
    setState(() {
      _running = true;
      _result = null;
    });
    final r = await runNodeTest(
      url: resolved ?? config.url,
      secure: config.isSecure,
    );
    if (!mounted || id != _runId) return;
    setState(() {
      _result = r;
      _running = false;
    });
  }

  @override
  void dispose() {
    _runId++; // an unfinished test should not touch a closed dialog
    super.dispose();
  }

  Icon _icon(NodeTestSeverity s, Color text) => switch (s) {
        NodeTestSeverity.good =>
          const Icon(Icons.check_circle, size: 18, color: Color(0xFF2ECC71)),
        NodeTestSeverity.warning =>
          const Icon(Icons.warning_amber, size: 18, color: Color(0xFFF5A623)),
        NodeTestSeverity.bad =>
          const Icon(Icons.error, size: 18, color: Color(0xFFE74C3C)),
      };

  @override
  Widget build(BuildContext context) {
    final styles = ref.watch(stylesProvider);
    final theme = ref.watch(themeProvider);
    final status = ref.watch(connectionStatusProvider);
    final result = _result;

    final Widget body;
    if (_running || result == null) {
      body = Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Testing the connection. This takes about 10 seconds.',
              style: styles.textStyleParagraph),
          const SizedBox(height: 14),
          const HsProgressBar(),
        ],
      );
    } else {
      final lines = describeNodeTest(result, status);
      body = Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Node: ${result.address}', style: styles.textStyleParagraph),
          const SizedBox(height: 10),
          for (final l in lines)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _icon(l.severity, theme.text),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(l.text, style: styles.textStyleParagraph),
                  ),
                ],
              ),
            ),
        ],
      );
    }

    final canReconnect = !_running &&
        result != null &&
        result.answered &&
        status != ConnectionStatus.live;

    return AppAlertDialog(
      title: Text('Node connection', style: styles.textStyleDialogHeader),
      content: SingleChildScrollView(child: body),
      actions: [
        TextButton(
          style: styles.dialogButtonStyle,
          onPressed: () => appRouter.pop(context),
          child: Text('CLOSE', style: styles.textStyleDialogOptions),
        ),
        TextButton(
          style: styles.dialogButtonStyle,
          onPressed: _running ? null : _run,
          child: Text('TEST AGAIN', style: styles.textStyleDialogOptions),
        ),
        if (canReconnect)
          TextButton(
            style: styles.dialogButtonStyle,
            onPressed: () {
              ref.read(connectionStatusProvider.notifier).retryNow();
              appRouter.pop(context);
            },
            child: Text('RECONNECT', style: styles.textStyleDialogOptions),
          ),
      ],
    );
  }
}
