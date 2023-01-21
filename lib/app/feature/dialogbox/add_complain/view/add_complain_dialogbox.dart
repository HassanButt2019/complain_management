import 'dart:async';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        // onModelReady: (model) async => await model.init(),
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
                            // controller: titleController,
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
                            // controller: subjectController,
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
                         Row(
                           children: [
                             Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("Complain Type",style: TextStyle(fontWeight: FontWeight.bold),),
                                 DropdownButtonHideUnderline(
                                   child: DropdownButton2(
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
                                     items: model.items
                                         .map((item) =>
                                         DropdownMenuItem<String>(
                                           value: item,
                                           child: Text(
                                             item,
                                             style: const TextStyle(
                                               fontSize: 14,
                                             ),
                                           ),
                                         ))
                                         .toList(),
                                     value: model.selectedValue,
                                     onChanged: (value) {
                                       // setState(() {
                                       //   selectedValue = value as String;
                                       // });
                                     },
                                     buttonHeight: 40,
                                     buttonWidth: 140,
                                     itemHeight: 40,
                                   ),
                                 ),
                               ],
                             ),
                             Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("Complain Location",style: TextStyle(fontWeight: FontWeight.bold),),
                                 DropdownButtonHideUnderline(
                                   child: DropdownButton2(
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
                                     items: model.items
                                         .map((item) =>
                                         DropdownMenuItem<String>(
                                           value: item,
                                           child: Text(
                                             item,
                                             style: const TextStyle(
                                               fontSize: 14,
                                             ),
                                           ),
                                         ))
                                         .toList(),
                                     value: model.selectedValue,
                                     onChanged: (value) {
                                       // setState(() {
                                       //   selectedValue = value as String;
                                       // });
                                     },
                                     buttonHeight: 40,
                                     buttonWidth: 140,
                                     itemHeight: 40,
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
                          onPressed: () => completer(DialogResponse(confirmed: true)),
                          child: Text(
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
