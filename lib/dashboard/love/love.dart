import 'package:funlove/opennode_icons/opennode_icons_icons.dart';
import 'package:funlove/types/profile.dart';
import 'package:funlove/utils/logger/logger.dart';
import 'package:funlove/widgets/main/love_cards.dart';
import 'package:funlove/widgets/profile/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:swipable_stack/swipable_stack.dart';

class LoveDashboardScreen extends StatefulHookConsumerWidget {
  const LoveDashboardScreen({super.key});

  @override
  ConsumerState<LoveDashboardScreen> createState() => _LoveDashboardScreen();
}

class _LoveDashboardScreen extends ConsumerState<LoveDashboardScreen> {
  final controller = SwipableStackController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = TextTheme.of(context);
    final url =
        "https://media.allure.com/photos/618153bc590337268c4b06fd/4:3/w_2664,h_1998,c_limit/My%20Beautiful%20Black%20Hair%201.jpg";

    final List<SouleProfile> souleList = [
      SouleProfile("Serena", 22, "Cotonou , Benin", [
        "https://i.pinimg.com/originals/aa/20/77/aa2077efbe69967069d4ef9285bf1b91.jpg",
      ]),
      SouleProfile("Ana", 18, "Paris , France", [
        "https://lh5.googleusercontent.com/proxy/cVc6TPr9iRxqQORAMX3K-wZdc82oJihZGRPAqiN7G_NSzjxItbtw7T498Zdw5V9nGsEGFu5edMpZVkJD6_2wf8XCf6lG5ErHGIkt6JrGU6addOsALF-GVNZrShpByy2A3IKW_GoYBm-3yo1rfDxB7vH9bunr19CRXUQ",
      ]),
      SouleProfile("Gabriel", 31, "Senegale , Dakar", [
        "https://i.pinimg.com/736x/36/9c/0b/369c0b57f5dd120832bfb848c639f064.jpg",
      ]),
      SouleProfile("Melicia", 23, "Angola , Cabinda", [
        "https://st5.depositphotos.com/26317112/66453/i/450/depositphotos_664532976-stock-photo-close-headshot-portrait-beautiful-young.jpg",
      ]),
      SouleProfile("Serena", 22, "Cotonou , Benin", [
        "https://i.pinimg.com/originals/aa/20/77/aa2077efbe69967069d4ef9285bf1b91.jpg",
      ]),
      SouleProfile("Ana", 18, "Paris , France", [
        "https://lh5.googleusercontent.com/proxy/cVc6TPr9iRxqQORAMX3K-wZdc82oJihZGRPAqiN7G_NSzjxItbtw7T498Zdw5V9nGsEGFu5edMpZVkJD6_2wf8XCf6lG5ErHGIkt6JrGU6addOsALF-GVNZrShpByy2A3IKW_GoYBm-3yo1rfDxB7vH9bunr19CRXUQ",
      ]),
      SouleProfile("Gabriel", 31, "Senegale , Dakar", [
        "https://i.pinimg.com/736x/36/9c/0b/369c0b57f5dd120832bfb848c639f064.jpg",
      ]),
      SouleProfile("Melicia", 23, "Angola , Cabinda", [
        "https://st5.depositphotos.com/26317112/66453/i/450/depositphotos_664532976-stock-photo-close-headshot-portrait-beautiful-young.jpg",
      ]),
      SouleProfile("Serena", 22, "Cotonou , Benin", [
        "https://i.pinimg.com/originals/aa/20/77/aa2077efbe69967069d4ef9285bf1b91.jpg",
      ]),
      SouleProfile("Ana", 18, "Paris , France", [
        "https://lh5.googleusercontent.com/proxy/cVc6TPr9iRxqQORAMX3K-wZdc82oJihZGRPAqiN7G_NSzjxItbtw7T498Zdw5V9nGsEGFu5edMpZVkJD6_2wf8XCf6lG5ErHGIkt6JrGU6addOsALF-GVNZrShpByy2A3IKW_GoYBm-3yo1rfDxB7vH9bunr19CRXUQ",
      ]),
      SouleProfile("Gabriel", 31, "Senegale , Dakar", [
        "https://i.pinimg.com/736x/36/9c/0b/369c0b57f5dd120832bfb848c639f064.jpg",
      ]),
      SouleProfile("Melicia", 23, "Angola , Cabinda", [
        "https://st5.depositphotos.com/26317112/66453/i/450/depositphotos_664532976-stock-photo-close-headshot-portrait-beautiful-young.jpg",
      ]),
      SouleProfile("Serena", 22, "Cotonou , Benin", [
        "https://i.pinimg.com/originals/aa/20/77/aa2077efbe69967069d4ef9285bf1b91.jpg",
      ]),
      SouleProfile("Ana", 18, "Paris , France", [
        "https://lh5.googleusercontent.com/proxy/cVc6TPr9iRxqQORAMX3K-wZdc82oJihZGRPAqiN7G_NSzjxItbtw7T498Zdw5V9nGsEGFu5edMpZVkJD6_2wf8XCf6lG5ErHGIkt6JrGU6addOsALF-GVNZrShpByy2A3IKW_GoYBm-3yo1rfDxB7vH9bunr19CRXUQ",
      ]),
      SouleProfile("Gabriel", 31, "Senegale , Dakar", [
        "https://i.pinimg.com/736x/36/9c/0b/369c0b57f5dd120832bfb848c639f064.jpg",
      ]),
      SouleProfile("Melicia", 23, "Angola , Cabinda", [
        "https://st5.depositphotos.com/26317112/66453/i/450/depositphotos_664532976-stock-photo-close-headshot-portrait-beautiful-young.jpg",
      ]),
    ];

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        backgroundColor: colors.surface,
        surfaceTintColor: colors.surface,
        leading: IconButton(
          onPressed: () => log(""),
          icon: ProfilePicture(url: url, width: 40, height: 40, padding: 0),
        ),

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(OpennodeIcons.funLove, color: Color(0xffef0038), size: 35),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                "FunLove",
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () => log(""), icon: Icon(Icons.notifications)),
        ],
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height * 0.8,
          ),

          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: 20,
                bottom: MediaQuery.of(context).padding.bottom,
              ),

              child: LoveCard(controller: controller, souleList: souleList),
            ),
          ),
        ),
      ),
    );
  }
}
