import 'package:flutter/material.dart';

class GradientContainerWidgets extends StatelessWidget {
  const GradientContainerWidgets(
      {super.key,
      this.width,
      this.height,
      this.radius,
      required this.colors,
      required this.begin,
      required this.end,
      this.child,
      this.padding,
      this.margin});

  final double? width, height, radius;
  final List<Color> colors;
  final AlignmentGeometry begin, end;
  final Widget? child;
  final EdgeInsetsGeometry? padding, margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 0),
          gradient: LinearGradient(colors: colors, begin: begin, end: end)),
      child: child,
    );
  }
}
