import 'package:flutter/material.dart';
import 'package:wheater_app/presentation/widgets/container_gradient.dart';

class DetailErrorWidget extends StatelessWidget {
  const DetailErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientContainerWidgets(
      colors: const [Colors.red, Colors.redAccent],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
    );
  }
}
