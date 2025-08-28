import 'package:funlove/utils/logger/logger.dart';
import 'package:funlove/widgets/st/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class MessagesDashboardScreen extends StatefulHookConsumerWidget {
  const MessagesDashboardScreen({super.key});

  @override
  ConsumerState<MessagesDashboardScreen> createState() =>
      _MessagesDashboardScreenState();
}

class _MessagesDashboardScreenState
    extends ConsumerState<MessagesDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StandardAppBar(
        title: "Chat",
        actions: [
          IconButton(
            onPressed: () => log("Clicked"),
            icon: Icon(LucideIcons.squarePen),
          ),
        ],
      ),

      body: Text("This the Messages dashboard screen"),
    );
  }
}
