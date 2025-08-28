import 'package:flutter/material.dart';

class StandardAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final void Function()? onBackPressed;
  final List<Widget>? actions;
  final bool centerTitle;
  const StandardAppBar({
    super.key,
    required this.title,
    this.onBackPressed,

    this.centerTitle = true,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return AppBar(
      leading: Navigator.canPop(context)
          ? IconButton(
              onPressed: onBackPressed ?? () => Navigator.pop(context),
              icon: Icon(Icons.chevron_left),
            )
          : null,
      centerTitle: centerTitle,
      title: Text(
        title,
        style: textTheme.bodyMedium?.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
