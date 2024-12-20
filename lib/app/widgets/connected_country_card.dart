import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:testcase/app/widgets/country_flag.dart';

import '../../core/utils/theme/app_colors.dart';
import '../controllers/connection/connection_controller.dart';
import 'text/label_small_text.dart';
import 'text/title_small_text.dart';

class ConnectedCountryCard extends HookConsumerWidget {
  const ConnectedCountryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColors = ref.watch(appColorsProvider);
    final connectionState = ref.watch(connectionControllerProvider);
    final country = connectionState.selectedCountry;

    final randomLocation = useState<String?>(null);

    String? displayRandomLocation() {
      final random = Random();
      final locations = country?.locations ?? [];

      if (locations.isEmpty) return null;

      final randomLocation = locations[random.nextInt(locations.length)];
      return randomLocation;
    }

    useEffect(() {
      if (country != null) {
        randomLocation.value = displayRandomLocation();
      }
      return null;
    }, [country]);

    final stealthPercent = useState<int?>(null);
    stealthPercent.value ??= Random().nextInt(100) + 1;

    return country == null
        ? SizedBox()
        : Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: appColors.drWhite,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                CountryFlagWidget(countryCode: country.code),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleSmallText(country.name ?? "",
                        fontWeight: FontWeight.w700),
                    LabelSmallText(
                      randomLocation.value ?? "",
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    LabelSmallText("Stealth"),
                    TitleSmallText(
                      "${stealthPercent.value}%",
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
