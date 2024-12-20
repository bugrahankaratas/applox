import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:testcase/app/widgets/svg_viewer.dart';
import 'package:testcase/app/widgets/text/label_large_text.dart';
import 'package:testcase/app/widgets/text/label_small_text.dart';
import 'package:testcase/core/enums/svg_paths.dart';

import '../../core/utils/theme/app_colors.dart';
import '../controllers/connection/connection_controller.dart';

class ConnectionNetworkInformation extends HookConsumerWidget {
  const ConnectionNetworkInformation({
    super.key,
    this.isDownload = true,
  });

  final bool isDownload;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColors = ref.watch(appColorsProvider);
    final connectionState = ref.watch(connectionControllerProvider);
    final connectionController =
        ref.read(connectionControllerProvider.notifier);
    final country = connectionState.selectedCountry;

    late final Timer timer;

    void startTimer() {
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        connectionController.setDownloadAndUploadSize();
      });
    }

    useEffect(() {
      startTimer();
      return timer.cancel;
    }, [connectionState.connectionTime]);

    return country == null
        ? SizedBox()
        : Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: appColors.drWhite,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: (isDownload
                            ? appColors.caribbeanGreen
                            : appColors.poppyRed)
                        .withOpacity(.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SvgViewer(
                      svgPath:
                          isDownload ? SvgPaths.download : SvgPaths.upload),
                ),
                SizedBox(width: 8),
                Column(
                  children: [
                    LabelSmallText(isDownload ? "Download" : "Upload"),
                    LabelLargeText(
                        "${isDownload ? connectionState.downloadSize.toStringAsFixed(2) : connectionState.uploadSize.toStringAsFixed(2)} MB",
                        fontWeight: FontWeight.w700),
                  ],
                )
              ],
            ),
          );
  }
}
