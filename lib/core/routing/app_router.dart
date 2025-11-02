import 'package:flutter/material.dart';
import 'package:smart_home/core/routing/routes.dart';
import 'package:smart_home/features/auth/presentation/views/home_setup_one_view.dart';
import 'package:smart_home/features/auth/presentation/views/home_setup_two_view.dart';
import 'package:smart_home/features/auth/presentation/views/reset_password_view.dart';
import 'package:smart_home/features/auth/presentation/views/sign_in_view.dart';
import 'package:smart_home/features/auth/presentation/views/smart_home_sign_in_view.dart';
import 'package:smart_home/features/auth/presentation/views/verify_code_view.dart';
import 'package:smart_home/features/onBoarding/presentation/views/on_boarding_view.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingView:
        return MaterialPageRoute(builder: (context) => OnBoardingView());
      case Routes.homeSignInView:
        return MaterialPageRoute(builder: (context) => SmartHomeSignInView());
      case Routes.signInView:
        return MaterialPageRoute(builder: (context) => SignInView());
      case Routes.resetPasswordView:
        return MaterialPageRoute(builder: (context) => ResetPasswordView());
      case Routes.verifyCodeView:
        return MaterialPageRoute(builder: (context) => VerifyCodeView());
      case Routes.homeSetupOneView:
        return MaterialPageRoute(builder: (context) => HomeSetupOneView());
      case Routes.homeSetupTwoView:
        return MaterialPageRoute(builder: (context) => HomeSetupTwoView());
      default:
        Scaffold(body: Center(child: Text("not found page")));
    }
    return null;
  }
}
