


import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:netpace/app/config/routes.dart';
import 'package:netpace/app/feature/api_service/complain_service.dart';
import 'package:netpace/app/feature/data/model/location.dart';
import 'package:netpace/app/feature/data/model/type.dart';
import 'package:netpace/app/feature/services/locator.dart';
import 'package:netpace/initializers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddComplainViewModel extends BaseViewModel
{

  final ComplainService _complainService = locator<ComplainService>();
  final NavigationService _navigationService = locator<NavigationService>();

   Location? _selectedLocation;
   ComplainType? _complainType;
   TextEditingController title = TextEditingController();
   TextEditingController subject = TextEditingController();

  List<Location> locations = [];
  List<ComplainType> types = [];
  bool _loadingLocation = false;
  bool get loadingLocation =>_loadingLocation;
  bool _loadingTypes = false;
  bool get loadingTypes =>_loadingTypes;

  Location? get selectedLocation =>_selectedLocation ?? null;
  ComplainType? get selectedType=>_complainType??null;
   XFile? photo = XFile("");
  bool _adding = false;
  bool get adding =>_adding;
  set adding(bool value)
  {
    _adding = value;
    notifyListeners();
  }
  set selectedLocation(Location? loc)
  {
    _selectedLocation = loc;
    notifyListeners();
  }
  set selectedType(ComplainType? ct)
  {
    _complainType = ct;
    notifyListeners();
  }
  set loadingLocation(bool value)
  {
    _loadingLocation = value;
    notifyListeners();
  }

  set loadingTypes(bool value)
  {
    _loadingLocation = value;
    notifyListeners();
  }

  Future<void> init()async
  {
    await getLocations();
   await getTypes();
  }


  Future<void> getLocations()async
  {
    // getComplains
    loadingLocation = true;
    final response = await _complainService.getLocations();
    print(response.data);
    if (response.success) {
      response.data.forEach((element) {
        locations.add(Location.fromJson(element));
      });
      notifyListeners();
    } else {
      snackbarKey.currentState?.hideCurrentSnackBar();
      snackbarKey.currentState
          ?.showSnackBar(SnackBar(content: Text(response.error)));
    }

    loadingLocation = false;

  }


  Future<void> getTypes()async
  {
    // getComplains
    loadingTypes = true;
    final response = await _complainService.getTypes();
    print(response.data);
    if (response.success) {
      response.data.forEach((element) {
        types.add(ComplainType.fromJson(element));
      });
      notifyListeners();
    } else {
      snackbarKey.currentState?.hideCurrentSnackBar();
      snackbarKey.currentState
          ?.showSnackBar(SnackBar(content: Text(response.error)));
    }

    loadingTypes = false;

  }
  Future<void> pickImage()async
  {
    final ImagePicker _picker = ImagePicker();
     photo = await _picker.pickImage(source: ImageSource.camera);
     notifyListeners();

  }


  Future<void> addComplain() async {
    adding = true;
    final response =
    await _complainService.addComplain(title.text.trim() , subject.text.trim() , selectedLocation! , selectedType!);
    print(response.data);

    if (response.success) {
      snackbarKey.currentState?.hideCurrentSnackBar();
      snackbarKey.currentState
          ?.showSnackBar(SnackBar(content: Text("Added Successfully")));
      _navigationService.clearStackAndShow(complainView);
    } else {
      snackbarKey.currentState?.hideCurrentSnackBar();
      snackbarKey.currentState
          ?.showSnackBar(SnackBar(content: Text(response.error)));
    }

    adding = false;
  }

}