import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:testcase/app/widgets/text/body_small_text.dart';
import 'package:testcase/app/widgets/text/headline_small_text.dart';
import 'package:testcase/core/extension/time_difference.dart';

import '../controllers/connection/connection_controller.dart';

class ConnectingTime extends HookConsumerWidget {
  const ConnectingTime({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connectionState = ref.watch(connectionControllerProvider);
    final timeDifference = useState<String?>(null);

    late final Timer timer;

    void startTimer() {
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        timeDifference.value =
            connectionState.connectionTime?.differenceFromNow;
      });
    }

    useEffect(() {
      startTimer();
      return timer.cancel;
    }, [connectionState.connectionTime]);

    return connectionState.selectedCountry == null
        ? SizedBox()
        : Column(
            children: [
              BodySmallText("Connection Time"),
              SizedBox(height: 4),
              HeadlineSmallText(
                timeDifference.value ?? "00:00:00",
                fontWeight: FontWeight.w700,
              ),
            ],
          );
  }
}
