


import 'package:flutter/material.dart';

import 'app/feature/services/bottom_sheet_service.dart';
import 'app/feature/services/dialog_box_service.dart';
import 'app/feature/services/locator.dart';


Future<void> initializeRvRentApplication() async
{
    setupLocator();
   setupBottomSheetUi();
   setupDialogUi();
}
final GlobalKey<ScaffoldMessengerState> snackbarKey =
GlobalKey<ScaffoldMessengerState>();