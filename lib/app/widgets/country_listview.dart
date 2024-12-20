import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:testcase/app/models/country_model.dart';

import '../../core/enums/svg_paths.dart';
import '../controllers/connection/connection_controller.dart';
import 'country_connection_card.dart';
import 'svg_viewer.dart';
import 'text/label_medium_text.dart';

class CountryListview extends HookConsumerWidget {
  const CountryListview({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connectionState = ref.watch(connectionControllerProvider);
    final countryList = connectionState.filteredList ?? CountryModel.mockList;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const LabelMedium('Free Locations (3)'),
            SvgViewer(svgPath: SvgPaths.infoCircle),
          ],
        ),
        const SizedBox(height: 4),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemCount: countryList.length,
          itemBuilder: (context, index) {
            final country = countryList[index];
            return CountryConnectionCard(country: country);
          },
        ),
      ],
    );
  }
}
