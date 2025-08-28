import 'package:flutter/material.dart';

class ListTitleOption extends StatelessWidget {
  final void Function()? onTap;
  final Widget? icon;
  final String label;
  final Widget? trailing;
  final VisualDensity? density;
  final Color? color;
  final ShapeBorder? shape;
  final double radius;
  final Color? foreground;
  const ListTitleOption({
    super.key,
    this.onTap,
    this.icon,
    required this.label,
    this.trailing,
    this.density,
    this.color,
    this.shape,
    this.radius = 10,
    this.foreground,
  });
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListTile(
      visualDensity: density ?? VisualDensity(horizontal: -3, vertical: -3),
      onTap: onTap,
      shape:
          shape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(radius),
          ),
      tileColor: color ?? colors.surfaceContainer,
      leading: icon,
      title: Text(
        label,
        style: TextTheme.of(context).bodyMedium?.copyWith(color: foreground),
      ),
      trailing: trailing,
    );
  }
}
