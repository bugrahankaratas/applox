import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:testcase/app/widgets/svg_viewer.dart';
import 'package:testcase/core/enums/svg_paths.dart';

import '../../core/utils/theme/app_colors.dart';

class SelectableIconButton extends HookConsumerWidget {
  const SelectableIconButton({
    super.key,
    this.isSelected = false,
    this.icon,
    this.onTap,
    this.buttonColor,
    this.iconColor,
    this.width,
    this.height,
    this.iconPadding,
  });

  final bool isSelected;
  final SvgPaths? icon;
  final VoidCallback? onTap;
  final Color? buttonColor;
  final Color? iconColor;
  final double? width;
  final double? height;
  final double? iconPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColors = ref.watch(appColorsProvider);
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(iconPadding ?? 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: buttonColor ??
              (isSelected
                  ? appColors.blue
                  : appColors.softBlack.withOpacity(.06)),
        ),
        child: SvgViewer(
          svgPath: icon ?? SvgPaths.rightArrow,
          color: iconColor ?? (isSelected ? appColors.drWhite : null),
        ),
      ),
    );
  }
}
