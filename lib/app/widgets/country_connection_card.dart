import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:testcase/app/controllers/connection/connection_controller.dart';
import 'package:testcase/app/models/country_model.dart';
import 'package:testcase/app/widgets/country_flag.dart';
import 'package:testcase/app/widgets/text/label_small_text.dart';
import 'package:testcase/app/widgets/text/title_small_text.dart';
import 'package:testcase/core/enums/svg_paths.dart';

import '../../core/route/app_router.dart';
import '../../core/utils/theme/app_colors.dart';
import 'selectable_icon_button.dart';

class CountryConnectionCard extends HookConsumerWidget {
  const CountryConnectionCard({
    super.key,
    this.country,
  });

  final CountryModel? country;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColors = ref.watch(appColorsProvider);
    final connectionState = ref.watch(connectionControllerProvider);
    final connectionController =
        ref.watch(connectionControllerProvider.notifier);

    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: appColors.drWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CountryFlagWidget(countryCode: country?.code),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleSmallText(
                country?.name ?? "",
                fontWeight: FontWeight.w700,
              ),
              LabelSmallText("${country?.locations?.length ?? 0} Locations"),
            ],
          ),
          Spacer(),
          SelectableIconButton(
            isSelected: connectionState.selectedCountry == country,
            icon: SvgPaths.power,
            onTap: () {
              connectionController.toggleVPN(country);
            },
          ),
          SizedBox(width: 8),
          SelectableIconButton(
            onTap: () {
              context.router
                  .push(CountryDetailRoute(country: country ?? CountryModel()));
            },
          ),
        ],
      ),
    );
  }
}
