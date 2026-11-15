import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../core/core_providers.dart';
import '../hoosat/hoosat.dart';
import '../util/numberutil.dart';
import 'fiat_value_container.dart';

class AmountLabel extends HookConsumerWidget {
  final Amount amount;

  const AmountLabel({Key? key, required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    final symbol = ref.watch(symbolProvider(amount));

    final formatedAmount = useMemoized(() {
      return NumberUtil.formatedAmount(amount);
    }, [amount]);

    final exactAmount = useMemoized(() {
      return NumberUtil.approx(
            amount: amount,
            precision: amount.decimals,
          ) +
          ' $symbol';
    }, [amount]);

    return FiatValueContainer(
      amount: amount,
      child: Container(
        margin: EdgeInsets.only(
          left: 22.0,
          right: 22.0,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 15,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: theme.backgroundDarkest,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: theme.text10),
        ),
        child: Tooltip(
          message: exactAmount,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: formatedAmount,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: theme.text,
                      ),
                    ),
                    TextSpan(
                      text: ' $symbol',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: theme.text60,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
