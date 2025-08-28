import 'dart:ui';

import 'package:funlove/notifiers/provders.dart';
import 'package:funlove/utils/logger/logger.dart';
import 'package:funlove/widgets/func/profile/fun_fact.dart';
import 'package:funlove/widgets/func/profile/static_column.dart';
import 'package:funlove/widgets/func/profile/text_separator.dart';
import 'package:funlove/widgets/profile/profile_picture.dart';
import 'package:funlove/widgets/st/list_title.dart';
import 'package:funlove/widgets/st/swicth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ProfileDashboardScreen extends StatefulHookConsumerWidget {
  const ProfileDashboardScreen({super.key});

  @override
  ConsumerState<ProfileDashboardScreen> createState() =>
      _ProfileDashboardScreen();
}

class _ProfileDashboardScreen extends ConsumerState<ProfileDashboardScreen> {
  late ScrollController _scrollController;
  double scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();

    _scrollController.addListener(() {
      setState(() {
        scrollOffset = _scrollController.offset;
        log(scrollOffset.toString());
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeModeProvider = ref.watch(themeProvider);
    final themeModeNotifier = ref.watch(themeProvider.notifier);

    final themeMode = useState(ThemeMode.system);
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final url =
        "https://media.allure.com/photos/618153bc590337268c4b06fd/4:3/w_2664,h_1998,c_limit/My%20Beautiful%20Black%20Hair%201.jpg";

    useEffect(() {
      themeModeProvider.whenData((data) => themeMode.value = data);
      return null;
    }, [themeModeProvider]);

    final profileItems = [
      {
        "icon": Icon(Icons.brightness_medium),
        "label": themeMode.value != ThemeMode.dark ? "Dark" : "Light",
        "trailing": CustomSwitch(
          value: themeMode.value == ThemeMode.dark,
          onChanged: (value) => themeModeNotifier.saveThemeMode(
            value ? ThemeMode.dark : ThemeMode.light,
          ),
        ),
        "onTap": () => themeModeNotifier.saveThemeMode(
          themeMode.value != ThemeMode.dark ? ThemeMode.dark : ThemeMode.light,
        ),
      },
      {
        "icon": Icon(Icons.person),
        "label": "Profile",
        "trailing": Icon(Icons.chevron_right),
      },
      {
        "icon": Icon(Icons.notifications),
        "label": "Notifications",
        "trailing": Icon(Icons.chevron_right),
      },
      {
        "icon": Icon(Icons.translate),
        "label": "Language",
        "trailing": Icon(Icons.chevron_right),
      },
      // {
      // "icon": Icon(Icons.person_pin_circle_outlined),
      //  "label": "Localisation",
      //  "trailing": Icon(Icons.chevron_right),
      //  },
    ];
    final othersProfileItems = [
      {
        "icon": Icon(Icons.security),
        "label": "Privacy",
        "trailing": Icon(Icons.chevron_right),
      },
      {
        "icon": Icon(Icons.logout, color: colors.primary),
        "label": "Log out",
        "trailing": Icon(Icons.chevron_right, color: colors.primary),
        "onBackground": colors.primary,
      },
    ];

    final funFactList = [
      {
        "icon": Icon(Icons.work),
        "text": "My Work: teacher",
        "onTap": () => log("Taped"),
      },
      {
        "icon": Icon(Icons.timer),
        "text": "I spend too much time: Learning",
        "onTap": () => log("Taped"),
      },
      {
        "icon": Icon(LucideIcons.sparkles),
        "text": "Most usefull skill: Cooking",
        "onTap": () => log("Taped"),
      },
      {
        "icon": Icon(Icons.language),
        "text": "Speaks english",
        "onTap": () => log("Taped"),
      },
      {
        "icon": Icon(Icons.beenhere),
        "text": "Identity verified",
        "onTap": () => log("Taped"),
      },
    ];

    double calculateShrink(double value, double offset, double min) {
      return (value - offset) <= min ? min : (value - offset);
    }

    return Scaffold(
      backgroundColor: colors.surface,
      /* appBar: StandardAppBar(title: "Profile", actions: [
     // Switch(value: themeMode.value == ThemeMode.dark , onChanged: (value)=> themeModeNotifier.saveThemeMode(value ? ThemeMode.dark : ThemeMode.light))
    ],), */
      body: Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 500),
            child: LayoutBuilder(
              builder: (ctx, c) {
                return Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeOut,
                      height: calculateShrink(200, (scrollOffset / 4), 100),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(url),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: ((scrollOffset / 8) + 8.0) <= 8
                              ? 8
                              : ((scrollOffset / 8) + 8.0),
                          sigmaY: ((scrollOffset / 4) + 8.0) <= 8
                              ? 8
                              : ((scrollOffset / 4) + 8.0),
                        ),
                        child: Container(),
                      ),
                    ),
                    Positioned(
                      top: calculateShrink(140, (scrollOffset / 2), 0),
                      child: Container(
                        height: 400,
                        width: c.maxWidth,
                        decoration: BoxDecoration(
                          color: colors.surface,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    ProfilePicture(
                      url: url,
                      width: calculateShrink(130, (scrollOffset / 4), 60),
                      height: calculateShrink(130, (scrollOffset / 4), 60),
                    ),
                  ],
                );
              },
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              controller: _scrollController,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom,
                ),

                child: Column(
                  children: [
                    LayoutBuilder(
                      builder: (ctx, c) {
                        return Column(
                          spacing: 10,

                          children: [
                            Column(
                              spacing: 5,
                              children: [
                                Text(
                                  "Marina Gomez",

                                  style: theme.textTheme.bodyLarge?.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: c.maxWidth * 0.8,
                                  ),
                                  child: Text(
                                    "I am a girl who is very open to meeting new people and also very jealous 🤭",
                                    textAlign: TextAlign.center,
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: colors.onBackground.withValues(
                                        alpha: 0.8,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            buildStatisticColumnCountCard([
                              buildStatisticCountColumn("Likes", 3, context),
                              buildStatisticCountColumn("Crush", 5, context),
                            ], context),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 15),

                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        spacing: 15,
                        children: [
                          Column(
                            spacing: 2,
                            children: List.generate(funFactList.length, (
                              index,
                            ) {
                              final fact = funFactList[index];
                              final icon = fact["icon"] as dynamic;
                              final text = fact["text"] as dynamic;
                              final onTap = fact["onTap"] as dynamic;

                              return buildFunfact(icon, text, onTap);
                            }),
                          ),

                          buildTextSepartor("Settings", context),
                          Column(
                            spacing: 10,
                            children: List.generate(profileItems.length, (
                              index,
                            ) {
                              final item = profileItems[index];
                              final icon = item["icon"] as Widget?;
                              final label = item["label"] as String;
                              final trailing = item["trailing"] as Widget?;
                              final onTap = item["onTap"] as dynamic;
                              return ListTitleOption(
                                onTap:
                                    onTap ??
                                    () {
                                      log("Taped");
                                    },
                                icon: icon,
                                label: label,
                                trailing: trailing,
                              );
                            }),
                          ),
                          buildTextSepartor("Others", context),
                          Column(
                            spacing: 10,
                            children: List.generate(othersProfileItems.length, (
                              index,
                            ) {
                              final item = othersProfileItems[index];
                              final icon = item["icon"] as Widget?;
                              final label = item["label"] as String;
                              final trailing = item["trailing"] as Widget?;
                              final onTap = item["onTap"] as dynamic;
                              final onBackground =
                                  item["onBackground"] as dynamic;
                              return ListTitleOption(
                                onTap:
                                    onTap ??
                                    () {
                                      log("Taped");
                                    },
                                foreground: onBackground,
                                icon: icon,
                                label: label,
                                trailing: trailing,
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
