// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/enums/svg_paths.dart';

class SvgViewer extends StatelessWidget {
  const SvgViewer({
    super.key,
    required this.svgPath,
    this.color,
    this.height,
    this.width,
    this.fit,
  });

  final SvgPaths svgPath;
  final Color? color;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgPath.path,
      height: height,
      width: width,
      color: color,
      fit: fit ?? BoxFit.contain,
    );
  }
}
