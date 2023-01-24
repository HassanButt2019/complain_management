


import 'package:flutter/material.dart';
import 'package:netpace/app/config/routes.dart';
import 'package:netpace/app/feature/api_service/complain_service.dart';
import 'package:netpace/app/feature/data/model/location.dart';
import 'package:netpace/app/feature/data/model/type.dart';
import 'package:netpace/app/feature/services/locator.dart';
import 'package:netpace/initializers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChangeStatusDialogViewModel extends BaseViewModel
{

  final ComplainService _complainService = locator<ComplainService>();
  final NavigationService _navigationService = locator<NavigationService>();

  bool _adding = false;
  bool get adding =>_adding;
  set adding(bool value)
  {
    _adding = value;
    notifyListeners();
  }

  Future<void> init()async
  {

  }






  Future<void> updateComplainStatus(String id) async {
    adding = true;
    final response =
    await _complainService.updateComplainStatus(id, "Resolved");
    if (response.success) {
      snackbarKey.currentState?.hideCurrentSnackBar();
      snackbarKey.currentState
          ?.showSnackBar(SnackBar(content: Text("Resolved Successfully")));
      _navigationService.clearStackAndShow(complainView);
    } else {
      snackbarKey.currentState?.hideCurrentSnackBar();
      snackbarKey.currentState
          ?.showSnackBar(SnackBar(content: Text(response.error)));
    }

    adding = false;
  }

}