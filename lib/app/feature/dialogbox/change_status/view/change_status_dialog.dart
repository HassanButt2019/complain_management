import 'dart:async';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netpace/app/feature/data/model/location.dart';
import 'package:netpace/app/feature/data/model/type.dart';
import 'package:netpace/app/feature/dialogbox/add_complain/viewmodel/add_complain_viewmodel.dart';
import 'package:netpace/app/feature/dialogbox/change_status/viewmodel/change_status_dialog_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChangeStatusDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const ChangeStatusDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChangeStatusDialogViewModel>.reactive(
        onModelReady: (data) async => await data.init(),
        viewModelBuilder: () => ChangeStatusDialogViewModel(),
        builder: (context, model, child) {
          print(request.data["detail"]??"");
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
                          Container(
                            height: 40.h,
                            padding: EdgeInsets.all(12),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(request.data["title"]),
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
                          Container(
                            height: 40.h,
                            padding: EdgeInsets.all(12),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(request.data["detail"]),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ))),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100.w,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(color: Colors.white),
                            foregroundColor:
                            Colors.white, //change background color of button
                            backgroundColor:
                            Colors.red.shade300, //change text color of button
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          onPressed: ()async{
                           completer(DialogResponse(confirmed: true));
                          },
                          child:Text(
                            "Cancel",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
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
                            await model.updateComplainStatus(request.data["id"]);
                          },
                          child:model.adding?CircularProgressIndicator.adaptive() :Text(
                            "Resolve",
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
