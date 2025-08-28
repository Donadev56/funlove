import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:funlove/custom/scale_tap/scale_tap.dart';
import 'package:funlove/types/profile.dart';
import 'package:funlove/widgets/func/main/basic_stacked_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:swipable_stack/swipable_stack.dart';

class LoveCard extends HookConsumerWidget {
  final SwipableStackController controller;
  final List<SouleProfile> souleList;

  const LoveCard({
    super.key,
    required this.controller,
    required this.souleList,
  });

  @override
  Widget build(BuildContext context, ref) {
    final colors = Theme.of(context).colorScheme;
    final currentIndex = useState(0);

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 450, maxHeight: 470),
      child: LayoutBuilder(
        builder: (ctx, c) {
          return SwipableStack(
            itemCount: souleList.length,
            stackClipBehaviour: Clip.none,
            controller: controller,
            builder: (context, properties) {
              final currentSoule = souleList[properties.index];
              final isCurrent = properties.index == currentIndex.value;
              return Stack(
                clipBehavior: Clip.none,
                alignment: AlignmentGeometry.bottomCenter,
                children: [
                  Center(
                    child: Container(
                      height: c.maxHeight,
                      width: c.maxWidth * 0.9,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(currentSoule.images.first),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: colors.primary.withValues(alpha: 0.6),
                            spreadRadius: 8,
                            blurRadius: 24,
                            offset: Offset(0, 5),
                          ),
                        ],
                        color: colors.surfaceContainer,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  if (isCurrent)
                    buildBasicStackedData(
                      currentSoule.name,
                      currentSoule.age,
                      currentSoule.city,
                      context,
                    ),
                  if (isCurrent)
                    Positioned(
                          top: 420,

                          child: Row(
                            spacing: 30,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ReactionButton(
                                onPressed: () {},
                                icon: Icon(
                                  LucideIcons.x,
                                  color: colors.surface,
                                ),
                                color: Colors.red,
                                size: 80,
                              ),
                              ReactionButton(
                                onPressed: () {},
                                icon: Icon(
                                  LucideIcons.check,
                                  color: colors.surface,
                                ),
                                color: Colors.greenAccent,
                                size: 80,
                              ),
                            ],
                          ),
                        )
                        .animate()
                        .fadeIn(duration: 600.ms)
                        .slideY(begin: 0.3, curve: Curves.easeOut),
                ],
              );
              // Build each card widget here, e.g. using properties.index
            },
            onSwipeCompleted: (index, direction) {
              currentIndex.value = index + 1;
            },
          );
        },
      ),
    );
  }
}

class ReactionButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget icon;
  final Color color;
  final double size;

  const ReactionButton({
    super.key,
    this.onPressed,
    required this.icon,
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ScaleTap(
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: colors.surfaceContainer,
          borderRadius: BorderRadius.circular(50),

          boxShadow: [
            BoxShadow(
              color: colors.primary.withValues(alpha: 0.6),
              spreadRadius: 4,
              blurRadius: 16,
              offset: Offset(0, 4),
            ),
          ],
        ),

        child: Container(
          height: size / 2,
          width: size / 2,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50),
          ),
          child: icon,
        ),
      ),
    );
  }
}
