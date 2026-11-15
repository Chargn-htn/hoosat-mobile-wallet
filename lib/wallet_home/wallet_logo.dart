import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../themes/base_theme.dart';

/// The home-screen logo treatment (2026-11 redesign): a continuous soft
/// pulse + colored glow, a diagonal shimmer-light sweep every ~3.4s, and a
/// spin-on-tap. The app previously only had the spin-on-tap.
class WalletLogo extends HookWidget {
  final VoidCallback onTap;
  final AnimationController spinController;
  final Color accent;
  final Widget child;
  final double size;

  const WalletLogo({
    super.key,
    required this.onTap,
    required this.spinController,
    required this.accent,
    required this.child,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    final pulseController = useAnimationController(
      duration: const Duration(milliseconds: 2600),
    )..repeat(reverse: true);
    final shimmerController = useAnimationController(
      duration: const Duration(milliseconds: 3400),
    )..repeat();

    return InkWell(
      borderRadius: BorderRadius.circular(size / 2),
      onTap: onTap,
      child: AnimatedBuilder(
        animation: Listenable.merge([pulseController, shimmerController]),
        builder: (context, _) {
          // logoPop: 0%/100% = scale 1, 50% = scale 1.07, ease-in-out.
          final pulse = Curves.easeInOut.transform(pulseController.value);
          final scale = 1.0 + (0.07 * pulse);
          final glowOpacity = 0.3 + (0.25 * pulse);

          return Transform.scale(
            scale: scale,
            child: RotationTransition(
              turns: spinController,
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size / 2),
                  boxShadow: [
                    BoxShadow(
                      color: accent.withOpacitySafe(glowOpacity),
                      blurRadius: 16,
                    ),
                    BoxShadow(
                      color: accent.withOpacitySafe(0.6),
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(size / 2),
                  child: Stack(
                    children: [
                      child,
                      _ShimmerBand(
                          progress: shimmerController.value, size: size),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// shimmerSweep: 0% off-left/transparent, 6% opacity ~.95, 22% off-right/
/// transparent, then hidden until the cycle repeats at 100%.
class _ShimmerBand extends StatelessWidget {
  final double progress;
  final double size;

  const _ShimmerBand({required this.progress, required this.size});

  @override
  Widget build(BuildContext context) {
    const sweepEnd = 0.22;
    if (progress > sweepEnd) return const SizedBox.shrink();

    final t = progress / sweepEnd;
    final dx = -1.3 * size + (2.6 * size * t);
    final opacity = t < (0.06 / sweepEnd)
        ? (t / (0.06 / sweepEnd))
        : (1 - ((t - (0.06 / sweepEnd)) / (1 - (0.06 / sweepEnd))));

    return Positioned(
      left: dx,
      top: -size * 0.25,
      child: Opacity(
        opacity: opacity.clamp(0.0, 1.0) * 0.95,
        child: Transform.rotate(
          angle: 0.31, // 18deg
          child: Container(
            width: size * 0.45,
            height: size * 1.5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.white.withOpacitySafe(0),
                  Colors.white.withOpacitySafe(0.65),
                  Colors.white.withOpacitySafe(0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
