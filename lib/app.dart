import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/route/app_router.dart';
import 'core/utils/theme/theme.dart';

final router = AppRouter();

class App extends HookConsumerWidget {
  const App({super.key, this.routeObserver});

  final RouteObserver<PageRoute<dynamic>>? routeObserver;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Applox Test Case',
      theme: defaultTheme,
      routeInformationParser: router.defaultRouteParser(),
      routerDelegate: AutoRouterDelegate(
        router,
        navigatorObservers: () => [
          routeObserver ?? RouteObserver<PageRoute>(),
        ],
      ),
    );
  }
}
