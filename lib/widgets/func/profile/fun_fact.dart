import 'package:flutter/material.dart';

Widget buildFunfact(Widget icon, String text, void Function()? onTap) {
  return ListTile(
    leading: icon,
    title: Text(text),
    visualDensity: VisualDensity(horizontal: -3, vertical: -3),
    onTap: onTap,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(10),
    ),
  );
}
