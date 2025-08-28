import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final double? width;
  final double? height;
  final String url;
  final Color? backgroundColor;
  final double padding;

  const ProfilePicture({
    super.key,
    this.width,
    this.height,
    required this.url,
    this.backgroundColor,
    this.padding = 10,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeOut,
      width: width,
      height: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? colors.surface,
        shape: BoxShape.circle,
      ),
      child: CircleAvatar(backgroundImage: NetworkImage(url)),
    );
  }
}
