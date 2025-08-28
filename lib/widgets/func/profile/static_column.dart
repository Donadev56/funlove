import 'package:flutter/material.dart';

Widget buildStatisticCountColumn(
  String label,
  int value,
  BuildContext context,
) {
  final textTheme = TextTheme.of(context);
  return Column(
    spacing: 3,
    children: [
      Text(
        value.toString(),
        style: textTheme.bodyMedium?.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        label,
        style: textTheme.bodyMedium?.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}

Widget buildStatisticColumnCountCard(
  List<Widget> children,
  BuildContext context,
) {
  final colors = Theme.of(context).colorScheme;
  final separator = LayoutBuilder(
    builder: (ctx, intC) {
      return Container(
        height: intC.maxHeight * 0.8,
        width: 3,
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(10),
        ),
      );
    },
  );
  return LayoutBuilder(
    builder: (ctx, c) {
      return Container(
        width: c.maxWidth * 0.8,
        height: 65,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: BoxBorder.all(
            color: colors.onBackground.withValues(alpha: 0.05),
          ),
          color: colors.surfaceContainer,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              spreadRadius: 3,
              blurRadius: 30,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: LayoutBuilder(
          builder: (ctx, internalC) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate((children.length * 2) - 1, (index) {
                if (index % 2 != 0) {
                  return separator;
                }
                return children[(index / 2).toInt()];
              }),
            );
          },
        ),
      );
    },
  );
}
