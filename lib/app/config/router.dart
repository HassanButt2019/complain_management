import 'package:flutter/material.dart';
import 'package:netpace/app/feature/complaints/view/complaint_view.dart';
import 'package:netpace/app/feature/login/view/login_view.dart';
import 'package:netpace/app/feature/signup/view/signup_view.dart';
import 'package:netpace/app/feature/splash/view/splash_view.dart';
import '../config/routes.dart' as routes;

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.splashView:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case routes.loginView:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case routes.complainView:
      return MaterialPageRoute(builder: (context) =>  ComplaintsListView());
    case routes.signupView:
      return MaterialPageRoute(builder: (context) => const SignupView());

    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text('No path for ${settings.name}'),
          ),
        ),
      );
  }
}
