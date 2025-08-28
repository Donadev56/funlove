import 'package:funlove/dashboard/love/love.dart';
import 'package:funlove/dashboard/messages/messages.dart';
import 'package:funlove/dashboard/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:funlove/opennode_icons/opennode_icons_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PageManager extends StatefulHookConsumerWidget {
  const PageManager({super.key});

  @override
  ConsumerState<PageManager> createState() => _PageManagerState();
}

class _PageManagerState extends ConsumerState<PageManager> {
  @override
  Widget build(BuildContext context) {
    /// widget list
    final List<Widget> bottomBarPages = [
      ProfileDashboardScreen(),
      LoveDashboardScreen(),
      MessagesDashboardScreen(),
    ];

    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final currentPage = useState(1);

    return Scaffold(
      body: IndexedStack(index: currentPage.value, children: bottomBarPages),
      extendBody: true,
      bottomNavigationBar: NavigationBar(
        indicatorColor: colors.primary,
        backgroundColor: colors.surface,
        onDestinationSelected: (index) {
          currentPage.value = index;
        },
        selectedIndex: currentPage.value,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: 'You',
          ),
          NavigationDestination(
            selectedIcon: Badge(child: Icon(OpennodeIcons.funLove)),
            icon: Badge(child: Icon(OpennodeIcons.funLove)),
            label: 'Love',
          ),
          NavigationDestination(
            icon: Badge(label: Text('2'), child: Icon(Icons.messenger_sharp)),
            label: 'Chat',
          ),
        ],
      ),
    );
  }
}
