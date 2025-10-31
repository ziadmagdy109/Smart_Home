import 'package:flutter/material.dart';
import 'package:smart_home/core/routing/routes.dart';
import 'package:smart_home/features/onBoarding/presentation/views/on_boarding_view.dart';
import 'package:smart_home/features/sign_in/presentation/views/smart_home_sign_in_view.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingView:
        return MaterialPageRoute(builder: (context) => OnBoardingView());
      case Routes.homeSignInView:
        return MaterialPageRoute(builder: (context) => SmartHomeSignInView());
      default:
        Scaffold(body: Center(child: Text("not found page")));
    }
    return null;
  }
}
