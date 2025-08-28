import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

Widget buildBasicStackedData(
  String name,
  int age,
  String localisation,
  BuildContext context,
) {
  final textTheme = TextTheme.of(context);
  return Positioned(
    top: 340,
    left: 45,
    child:
        Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 5,
              children: [
                Text(
                  "$name , $age",
                  style: textTheme.bodyLarge?.copyWith(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 5,
                  children: [
                    Icon(
                      Icons.person_pin_circle_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                    Text(
                      localisation,
                      style: textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            )
            .animate()
            .fadeIn(duration: 600.ms)
            .slideY(begin: 0.3, curve: Curves.easeOut),
  );
}
