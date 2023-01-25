import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netpace/app/config/routes.dart';
import 'package:netpace/app/feature/api_service/auth_service.dart';
import 'package:netpace/app/feature/services/locator.dart';
import 'package:netpace/initializers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignupViewModel extends BaseViewModel {
  FocusNode focusEmail =  FocusNode();
  FocusNode focusPass =  FocusNode();
  FocusNode focusUserName =  FocusNode();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController userName = TextEditingController();

  bool _signupLoading = false;

  bool get signupLoading =>_signupLoading;
  set signupLoading(bool value)
  {
    _signupLoading = value;
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

  Future<void> signupUser() async {
    signupLoading = true;
    final response =
        await _authService.signupUser(email.text.trim(), password.text.trim() , userName.text.trim());
    print(response.data);

    if (response.success) {
      await navigateToLoginView();
    } else {
      snackbarKey.currentState?.hideCurrentSnackBar();
      snackbarKey.currentState
          ?.showSnackBar(SnackBar(content: Text(response.error)));
    }

    signupLoading = false;
  }

  Future<void> navigateToLoginView() async {
    _navigationService.clearStackAndShow(loginView);
  }
}
