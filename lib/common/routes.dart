import 'package:flutter/material.dart';
import 'package:wheater_app/domain/model/wheater/wheater.dart';
import 'package:wheater_app/presentation/pages/home_page.dart';

import '../presentation/pages/splash/splash_view.dart';

class Routes {
  static const String splashView = '/';
  static const String onBoardingView = 'onboarding_view';
  static const String homeView = 'home_view';
  static const String detailView = 'detail_view';
}

class ScreenArguments {
  final String? cityName;
  final String? latitude;
  final String? longitude;
  final WheaterModel? whaterModel;

  ScreenArguments(
      {this.cityName, this.latitude, this.longitude, this.whaterModel});
}

class AppRoutes {
  static Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashView:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.homeView:
        return MaterialPageRoute(builder: (builder) => const HomePage());
      default:
        return MaterialPageRoute(
            builder: (builder) => const Scaffold(
                  body: Center(
                    child: Text('Error'),
                  ),
                ));
    }
  }
}
