import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CountryFlagWidget extends HookConsumerWidget {
  const CountryFlagWidget({
    super.key,
    this.countryCode,
    this.width,
    this.height,
  });

  final String? countryCode;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: CountryFlag.fromCountryCode(
        countryCode ?? "-",
        width: width ?? 38,
        height: height ?? 30,
      ),
    );
  }
}
