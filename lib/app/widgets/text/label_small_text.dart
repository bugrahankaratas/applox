import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/utils/theme/app_colors.dart';

class LabelSmallText extends HookConsumerWidget {
  const LabelSmallText(
    this.text, {
    super.key,
    this.color,
    this.textOverflow,
    this.softWrap,
    this.fontWeight,
    this.textAlign,
    this.decoration,
    this.opacity,
    this.letterSpacing,
    this.maxLines,
    this.fontSize,
  });

  final String text;
  final Color? color;
  final TextOverflow? textOverflow;
  final bool? softWrap;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final double? opacity;
  final double? letterSpacing;
  final int? maxLines;
  final double? fontSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColors = ref.watch(appColorsProvider);
    return Text(
      text,
      softWrap: softWrap,
      textAlign: textAlign,
      maxLines: maxLines,
      style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color:
                (color ?? appColors.defaultTextColor).withOpacity(opacity ?? 1),
            overflow: textOverflow,
            fontWeight: fontWeight,
            decoration: decoration,
            letterSpacing: letterSpacing,
            fontSize: fontSize,
          ),
    );
  }
}
