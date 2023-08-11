import 'dart:ui';

import 'package:flutter/material.dart';

class Glashmorphism extends StatelessWidget {
  const Glashmorphism({super.key, this.child, this.width, this.height});
  final Widget? child;
  final double? width, height;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 200, sigmaY: 0.5),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(.1),
              borderRadius: BorderRadius.circular(20),
              border:
                  Border.all(width: 3, color: Colors.white.withOpacity(.8))),
          child: child,
        ),
      ),
    );
  }
}
