import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:testcase/app/widgets/svg_viewer.dart';
import 'package:testcase/core/enums/svg_paths.dart';

import '../../core/utils/theme/app_colors.dart';
import '../controllers/connection/connection_controller.dart';

class CountrySearchTextfield extends HookConsumerWidget {
  const CountrySearchTextfield({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColors = ref.watch(appColorsProvider);
    final connectionController =
        ref.watch(connectionControllerProvider.notifier);

    return TextField(
      onTapOutside: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      cursorColor: appColors.blue,
      onChanged: connectionController.filteredCountryList,
      decoration: InputDecoration(
        hintText: "Search For Country or City",
        suffixIcon: Padding(
          padding: const EdgeInsets.all(16),
          child: SvgViewer(svgPath: SvgPaths.search),
        ),
        filled: true,
        fillColor: appColors.drWhite,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
