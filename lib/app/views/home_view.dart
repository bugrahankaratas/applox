import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:testcase/app/widgets/custom_appbar.dart';

import '../../core/utils/theme/app_colors.dart';
import '../controllers/connection/connection_controller.dart';
import '../widgets/connection_summary.dart';
import '../widgets/country_listview.dart';
import '../widgets/no_connection.dart';

@RoutePage()
class HomeView extends HookConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColors = ref.watch(appColorsProvider);
    final connectState = ref.watch(connectionControllerProvider);

    final scrollController = useScrollController();

    return Scaffold(
      backgroundColor: appColors.scaffoldColor,
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          CustomAppbar(scrollController: scrollController),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  connectState.selectedCountry == null
                      ? const NoConnection()
                      : const ConnectionSummary(),
                  const SizedBox(height: 32),
                  const CountryListview(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
