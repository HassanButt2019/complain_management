



import 'package:flutter/material.dart';
import 'package:netpace/app/feature/services/bottom_sheet_service.dart';
import 'package:netpace/app/feature/services/dialog_box_service.dart';
import 'package:netpace/app/feature/services/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ComplaintsListViewModel extends BaseViewModel
{
  bool generated = false;
  var formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final subjectController = TextEditingController();
  var data = "";
  List<String> images1 = [
    "https://st4.depositphotos.com/1643295/24751/i/600/depositphotos_247513910-stock-photo-portrait-serious-mature-indian-businessman.jpg",
    "https://www.mckinsey.com/~/media/mckinsey/locations/asia/india/careers/our%20people/raman/india_careers_raman-sharma_quote-profile_1536x1152.jpg?mw=1536&car=48:59&cpx=Left&cpy=Top"
        "https://us.123rf.com/450wm/michaeljung/michaeljung1209/michaeljung120900015/15041949-attractive-female-white-collar-worker-in-office.jpg?ver=6",
    "https://www.manchester.ac.uk/study/international/country-specific-information/india/India-profile-video-pic-070519-edited.jpg"
  ];
  DialogService _dialogService = locator<DialogService>();



  Future<void> init()async
  {

  }


  Color getStatusColor(String value)
  {
    switch(value){
      case "Issued":
        return Colors.red;
      case "Active":
        return Colors.green;
      case "Completed":
        return Colors.blue;
      default:
        return Colors.black;
    }
  }
  Future<void> showCustomBottomSheet() async {
    var sheetResponse = await _dialogService.showCustomDialog(
      variant: DialogBoxType.complainDialog,
      title: 'Add Complain',
      mainButtonTitle: 'Add',
    );

    print('confirmationResponse confirmed: ${sheetResponse?.confirmed}');
  }
}