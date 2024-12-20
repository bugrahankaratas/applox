import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:testcase/app/widgets/text/title_large_text.dart';

class NoConnection extends HookConsumerWidget {
  const NoConnection({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: TitleLargeText(
        "You can connect to fast and secure VPN servers",
        textAlign: TextAlign.center,
      ),
    );
  }
}
