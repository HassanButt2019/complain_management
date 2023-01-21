import 'package:flutter/material.dart';
import 'package:netpace/app/feature/dialogbox/add_complain/view/add_complain_dialogbox.dart';
import 'package:stacked_services/stacked_services.dart';

import 'locator.dart';

enum DialogBoxType {
  complainDialog,
}


void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogBoxType.complainDialog: (BuildContext context, DialogRequest request,
        Function(DialogResponse) completer) =>
        AddComplainBottomSheet(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}