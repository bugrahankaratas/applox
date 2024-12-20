import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:testcase/core/enums/page_paths.dart';
import 'package:testcase/core/route/main_view.dart';

import '../../app/models/country_model.dart';
import '../../app/views/country_detail_view.dart';
import '../../app/views/home_view.dart';
import '../../app/views/settings_view.dart';
import '../../app/views/splash_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "View,Route")
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          path: PagePaths.splash.name,
          initial: true,
        ),
        AutoRoute(
          page: CountryDetailRoute.page,
          path: PagePaths.countryDetail.name,
        ),
        AutoRoute(
          page: MainRoute.page,
          path: PagePaths.main.name,
          children: [
            AutoRoute(
              page: HomeRoute.page,
              path: PagePaths.home.name,
              initial: true,
            ),
            AutoRoute(
              page: SettingsRoute.page,
              path: PagePaths.settings.name,
            ),
          ],
        ),
      ];
}
