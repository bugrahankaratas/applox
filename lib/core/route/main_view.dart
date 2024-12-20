import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:testcase/app/controllers/connection/connection_controller.dart';
import 'package:testcase/app/widgets/svg_viewer.dart';
import 'package:testcase/app/widgets/text/label_large_text.dart';
import 'package:testcase/app/widgets/text/title_large_text.dart';
import 'package:testcase/core/enums/svg_paths.dart';

import '../utils/theme/app_colors.dart';
import 'app_router.dart';

@RoutePage()
class MainView extends HookConsumerWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColors = ref.watch(appColorsProvider);
    final connectionController =
        ref.watch(connectionControllerProvider.notifier);
    final connectionState = ref.watch(connectionControllerProvider);

    return AutoTabsScaffold(
      bottomNavigationBuilder: (_, tabsRouter) {
        int currentIndex = tabsRouter.activeIndex;
        return BottomNavigationBar(
          backgroundColor: appColors.drWhite,
          currentIndex: currentIndex,
          selectedItemColor: appColors.blue,
          unselectedItemColor: appColors.softBlack,
          selectedLabelStyle: TextStyle(color: appColors.blue),
          unselectedLabelStyle: TextStyle(color: appColors.softBlack),
          onTap: (index) {
            if (index == 1) {
              if (connectionState.selectedCountry != null) {
                _onDisconnectPressed(context, connectionController, appColors);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('No country selected to disconnect.')),
                );
              }
            } else {
              tabsRouter.setActiveIndex(index);
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgViewer(
                svgPath: SvgPaths.map,
                color: currentIndex == 0 ? appColors.blue : appColors.softBlack,
              ),
              label: 'Countries',
            ),
            BottomNavigationBarItem(
              icon: SvgViewer(
                svgPath: SvgPaths.radar,
                color: currentIndex == 1 ? appColors.blue : appColors.softBlack,
              ),
              label: 'Disconnect',
            ),
            BottomNavigationBarItem(
              icon: SvgViewer(
                svgPath: SvgPaths.setting,
                color: currentIndex == 2 ? appColors.blue : appColors.softBlack,
              ),
              label: 'Settings',
            ),
          ],
        );
      },
      routes: const [
        HomeRoute(),
        HomeRoute(),
        SettingsRoute(),
      ],
    );
  }

  void _onDisconnectPressed(BuildContext context,
      ConnectionController connectionController, AppColors appColors) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          backgroundColor: appColors.drWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.warning_amber_rounded,
                  color: appColors.blue,
                  size: 50,
                ),
                const SizedBox(height: 20),
                TitleLargeText(
                  'Are you sure you want to disconnect?',
                  color: appColors.softBlack,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: LabelLargeText(
                        'Cancel',
                        color: appColors.softBlack,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        connectionController.disconnectVPN();
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: appColors.blue,
                      ),
                      child: LabelLargeText(
                        'Disconnect',
                        color: appColors.drWhite,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
