// import 'package:netpace/app/feature/bottom_sheet/add_complain/view/add_complain_dialogbox.dart';
import 'package:stacked_services/stacked_services.dart';

import 'locator.dart';

enum BottomSheetType {
  addComplain,
}


void setupBottomSheetUi() {
  final bottomSheetService = locator<BottomSheetService>();

  final builders = {
    // BottomSheetType.addComplain: (context, sheetRequest, completer) =>
    //     AddComplainBottomSheet(request: sheetRequest, completer: completer)
  };

  // bottomSheetService.setCustomSheetBuilders(builders);
}