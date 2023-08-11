import 'package:flutter/material.dart';

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({super.key, this.width, this.height, this.color});

  final double? width, height;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 1,
      height: height ?? 40,
      color: color ?? Colors.grey[800]?.withOpacity(.3),
    );
  }
}
