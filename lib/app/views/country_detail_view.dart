import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:testcase/app/models/country_model.dart';
import 'package:testcase/app/widgets/text/headline_small_text.dart';
import 'package:testcase/app/widgets/text/title_large_text.dart';
import 'package:testcase/app/widgets/text/title_medium_text.dart';

import '../../core/utils/theme/app_colors.dart';
import '../widgets/country_flag.dart';

@RoutePage()
class CountryDetailView extends HookConsumerWidget {
  const CountryDetailView({
    super.key,
    required this.country,
  });

  final CountryModel country;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColors = ref.watch(appColorsProvider);
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: appColors.scaffoldColor,
        title: TitleLargeText(
          country.name ?? "Country Name",
          color: appColors.softBlack,
          fontWeight: FontWeight.bold,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: appColors.scaffoldColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CountryFlagWidget(
                    countryCode: country.code,
                    height: 120,
                    width: 180,
                  ),
                ),
                const SizedBox(height: 24),
                HeadlineSmallText(
                  'Locations',
                  color: appColors.softBlack,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 16),
                ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: country.locations?.length ?? 0,
                  itemBuilder: (context, index) {
                    final location = country.locations?[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: appColors.drWhite,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: appColors.softBlack.withOpacity(0.1),
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ListTile(
                        title: TitleMediumText(location ?? ""),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
