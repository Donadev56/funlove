import 'package:flutter/material.dart';

Widget buildTextSepartor(String text, BuildContext context) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        text,
        style: TextTheme.of(
          context,
        ).bodyLarge?.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
