import 'package:funlove/notifiers/provders.dart';
import 'package:funlove/page_manager.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const FunLove()));
}

class FunLove extends StatefulHookConsumerWidget {
  const FunLove({super.key});

  @override
  ConsumerState<FunLove> createState() => _FunLoveState();
}

class _FunLoveState extends ConsumerState<FunLove> {
  @override
  Widget build(BuildContext context) {
    final themeNotifierProvider = ref.watch(themeProvider);
    final currentThemeMode = useState<ThemeMode>(ThemeMode.system);

    useEffect(() {
      themeNotifierProvider.whenData((data) => {currentThemeMode.value = data});
      return null;
    }, [themeNotifierProvider]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fun Love',
      themeMode: currentThemeMode.value,

      theme: FlexThemeData.light(scheme: FlexScheme.sakura),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.sakura),
      home: PageManager(),
    );
  }
}
