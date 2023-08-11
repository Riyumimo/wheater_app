import 'package:flutter/material.dart';
import 'package:wheater_app/presentation/widgets/container_gradient.dart';

class BagroundWidget extends StatelessWidget {
  const BagroundWidget({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GradientContainerWidgets(
      colors: const [Color(0xffFEE3BC), Color(0xFFF39876)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      width: double.infinity,
      height: double.infinity,
      child: child,
    );
  }
}
