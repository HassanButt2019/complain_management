import 'dart:async';


import 'package:flutter/material.dart';
import 'package:netpace/app/feature/login/view/login_view.dart';
import 'package:netpace/app/feature/services/locator.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends ChangeNotifier {
  NavigationService _navigationService = locator<NavigationService>();

  NavigationService get navigationService => _navigationService;

  Timer? _timer;
  String? _initRoute;


  Future<void> initModelView() async{

print("HELLO");
    _timer = Timer(Duration(seconds: 5), () async {
      navigationService.clearStackAndShowView(const LoginView());
    });
  }

  void disposeModeView() {
    _timer!.cancel();
  }
}
