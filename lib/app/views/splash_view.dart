import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:testcase/app/widgets/text/headline_large_text.dart';

import '../../core/route/app_router.dart';
import '../../core/utils/theme/app_colors.dart';
import '../controllers/connection/connection_controller.dart';

@RoutePage()
class SplashView extends HookConsumerWidget {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColors = ref.watch(appColorsProvider);
    final connectionController =
        ref.watch(connectionControllerProvider.notifier);

    useEffect(() {
      Future.microtask(() async {
        await connectionController.init();
        await Future.delayed(const Duration(seconds: 1));
        if (context.mounted) context.router.replace(const MainRoute());
      });
      return null;
    }, []);

    return Scaffold(
      backgroundColor: appColors.scaffoldColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircularProgressIndicator(
                color: appColors.caribbeanGreen.withOpacity(.6)),
          ),
          const SizedBox(height: 16),
          HeadlineLargeText("Connecting...",
              fontWeight: FontWeight.w700,
              color: appColors.caribbeanGreen.withOpacity(.6)),
        ],
      ),
    );
  }
}
