import 'package:flutter/material.dart';
import 'package:netpace/app/feature/dialogbox/add_complain/view/add_complain_dialogbox.dart';
import 'package:netpace/app/feature/dialogbox/change_status/view/change_status_dialog.dart';
import 'package:stacked_services/stacked_services.dart';

import 'locator.dart';

enum DialogBoxType {
  complainDialog,
  statusDialog
}


void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogBoxType.complainDialog: (BuildContext context, DialogRequest request,
        Function(DialogResponse) completer) =>
        AddComplainBottomSheet(request: request, completer: completer),
    DialogBoxType.statusDialog: (BuildContext context, DialogRequest request,
        Function(DialogResponse) completer) =>
        ChangeStatusDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}