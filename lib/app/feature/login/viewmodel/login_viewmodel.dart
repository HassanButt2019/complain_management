


import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netpace/app/config/routes.dart';
import 'package:netpace/app/feature/services/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel
{
  FocusNode focusEmail = new FocusNode();
  FocusNode focusPass = new FocusNode();
  var _timer;
  int pos=0;
  List<String> photos = ['images/building.png','images/family.png'];
  NavigationService _navigationService = locator<NavigationService>();





Future<void> init()async
{
      _timer = Timer.periodic(Duration(seconds: 7), (Timer t) {
        pos = (pos + 1) % photos.length;
        notifyListeners();
    });
}

Future<void> navigateToComplaintList()async
{
  _navigationService.clearStackAndShow(complainView);
}

}