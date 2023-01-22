import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netpace/app/config/routes.dart';
import 'package:netpace/app/feature/api_service/auth_service.dart';
import 'package:netpace/app/feature/services/locator.dart';
import 'package:netpace/initializers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  FocusNode focusEmail = new FocusNode();
  FocusNode focusPass = new FocusNode();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _loginLoading = false;

  bool get loginLoading =>_loginLoading;
  set loginLoading(bool value)
  {
    _loginLoading = value;
    notifyListeners();
  }

  var _timer;
  int pos = 0;
  List<String> photos = ['images/building.png', 'images/family.png'];
  final NavigationService _navigationService = locator<NavigationService>();

  final AuthService _authService = locator<AuthService>();

  Future<void> init() async {
    _timer = Timer.periodic(Duration(seconds: 7), (Timer t) {
      pos = (pos + 1) % photos.length;
      notifyListeners();
    });
  }

  Future<void> loginUser() async {
    loginLoading = true;
    final prefs = await SharedPreferences.getInstance();
    final response =
        await _authService.loginUser(email.text.trim(), password.text.trim());
    print(response.data);

    if (response.success) {
      prefs.setString("userId", response.data["id"]);
      print(prefs.get("userId"));
      await navigateToComplaintList();
    } else {
      snackbarKey.currentState?.hideCurrentSnackBar();
      snackbarKey.currentState
          ?.showSnackBar(SnackBar(content: Text(response.error)));
    }

    loginLoading = false;
  }

  Future<void> navigateToComplaintList() async {
    _navigationService.clearStackAndShow(complainView);
  }
}
