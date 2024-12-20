import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/utils/theme/app_colors.dart';

@RoutePage()
class SettingsView extends HookConsumerWidget {
  const SettingsView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColors = ref.watch(appColorsProvider);
    return Scaffold(
      backgroundColor: appColors.scaffoldColor,
      body: Center(
        child: Text("Settings View"),
      ),
    );
  }
}
