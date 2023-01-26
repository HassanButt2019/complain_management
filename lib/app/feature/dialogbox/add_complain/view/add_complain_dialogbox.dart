import 'dart:async';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netpace/app/feature/data/model/location.dart';
import 'package:netpace/app/feature/data/model/type.dart';
import 'package:netpace/app/feature/dialogbox/add_complain/viewmodel/add_complain_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddComplainBottomSheet extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const AddComplainBottomSheet({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddComplainViewModel>.reactive(
        onModelReady: (data) async => await data.init(),
        viewModelBuilder: () => AddComplainViewModel(),
        builder: (context, model, child) {
          return Dialog(
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    request.title ?? "",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[900],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    request.description ?? "",
                    style: TextStyle(color: Colors.grey),
                  ),

                  ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: double.infinity,
                        maxHeight: double.infinity,
                      ),
                      child: Form(
                          // key: _formKey,
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: RichText(
                                text: TextSpan(
                                    text: "Title",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                    ))),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: model.title,
                            // ignore: missing_return
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Enter Title";
                              }
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue.shade200, width: 2.0),
                                  borderRadius: new BorderRadius.circular(20),
                                ),
                                hintText: "Enter title of your complaint"),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: RichText(
                                text: TextSpan(
                                    text: "Subject",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                    ))),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: model.subject,
                            // ignore: missing_return
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Enter details";
                              }
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue.shade200, width: 2.0),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                hintText: "Enter detail of your complaint"),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: ()async{
                            await  model.pickImage();
                            },
                            child: Container(
                              height: 60.h,
                              padding: EdgeInsets.all(12),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(child: Text(model.photo!.path != ""?model.photo!.name :"Upload Image")),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                         Column(
                           children: [
                             Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("Complain Type",style: TextStyle(fontWeight: FontWeight.bold),),
                                 model.loadingTypes?
                                 CircularProgressIndicator.adaptive() :
                                 SizedBox(
                                   width: MediaQuery.of(context).size.width,
                                   child: DropdownButtonHideUnderline(
                                     child: DropdownButton2<ComplainType>(
                                       isExpanded: true,
                                       hint: Text(
                                         'Select Item',
                                         style: TextStyle(
                                           fontSize: 14,
                                           color: Theme
                                               .of(context)
                                               .hintColor,
                                         ),
                                       ),
                                       items: model.types
                                           .map((item) =>
                                           DropdownMenuItem<ComplainType>(
                                             value: item,
                                             child: Text(
                                               item.complainType,
                                               style: const TextStyle(
                                                 fontSize: 14,
                                               ),
                                             ),
                                           ))
                                           .toList(),
                                       value: model.selectedType,
                                       onChanged: (value) {
                                         model.selectedType = value!;
                                         // setState(() {
                                         //   selectedValue = value as String;
                                         // });
                                       },
                                       buttonHeight: 40,
                                       buttonWidth: 140,
                                       itemHeight: 40,
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                             SizedBox(height: 10.h,),
                             Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("Complain Location",style: TextStyle(fontWeight: FontWeight.bold),),
                                model.loadingLocation?CircularProgressIndicator.adaptive():
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: DropdownButtonHideUnderline(
                                     child: DropdownButton2<Location>(
                                       isExpanded: true,
                                       hint: Text(
                                         'Select Item',
                                         style: TextStyle(
                                           fontSize: 14,
                                           color: Theme
                                               .of(context)
                                               .hintColor,
                                         ),
                                       ),
                                       items: model.locations
                                           .map((item) =>
                                           DropdownMenuItem<Location>(
                                             value: item,
                                             child: Text(
                                               item.address,
                                               style: const TextStyle(
                                                 fontSize: 14,
                                               ),
                                             ),
                                           ))
                                           .toList(),
                                       value: model.selectedLocation,
                                       onChanged: (value) {
                                         model.selectedLocation= value!;
                                         // setState(() {
                                         //   selectedValue = value as String;
                                         // });
                                       },
                                       buttonHeight: 40,
                                       buttonWidth: 140,
                                       itemHeight: 40,
                                     ),
                                   ),
                                ),
                               ],
                             ),
                           ],
                         )
                        ],
                      ))),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100.w,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(color: Colors.white),
                            foregroundColor:
                                Colors.white, //change background color of button
                            backgroundColor:
                                Colors.purple.shade800, //change text color of button
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          onPressed: ()async{
                            await model.addComplain();
                             // .then((value) {
                             //   // completer(DialogResponse(confirmed: value));
                             // });
                          },
                          child:model.adding?CircularProgressIndicator.adaptive() :Text(
                            "Add",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
