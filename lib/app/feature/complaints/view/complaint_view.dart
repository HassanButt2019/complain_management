import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netpace/app/feature/complaints/viewmodel/complaint_viewmodel.dart';
import 'package:netpace/app/feature/data/model/complaint.dart';
import 'package:stacked/stacked.dart';

class ComplaintsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ComplaintsListViewModel>.reactive(
        onModelReady: (model) async => await model.init(),
        viewModelBuilder: () => ComplaintsListViewModel(),
        builder: (context, model, child) {
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                elevation: 1,
                backgroundColor: Colors.white,
                centerTitle: true,
                title: RichText(
                  text: TextSpan(
                      text: "Complaints",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    model.loading?Center(child: CircularProgressIndicator.adaptive(),):
                   model.complains.isEmpty?Center(child: Text("No Complains Yet"),) :
                   SizedBox(
                        height: MediaQuery.of(context).size.height * 0.95,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: model.complains.length,
                          itemBuilder: (context, index) {
                             final Complain c = model.complains[index];
                            return  ComplainListItem(
                                title: c.complainTitle,
                                detail:c.discription,
                                status:c.status,
                              complainId: c.id,
                            );
                          },
                        )),
                  ],
                ),
              ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: ()async{
              await model.showCustomBottomSheet();
            },
            isExtended: true,
            backgroundColor: Colors.deepPurple.shade800,
            label:Text( "Add Complain"),
          ),
          );
        });
  }
}

class ComplainListItem extends ViewModelWidget<ComplaintsListViewModel> {
  const ComplainListItem(
      {Key? key,
      required this.status,
      required this.title,
        required this.complainId,
      required this.detail})
      : super(key: key);

  final String title;
  final String status;
  final String detail;
  final String complainId;

  @override
  Widget build(BuildContext context, ComplaintsListViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
      child: InkWell(
        onTap:status!="Active"?null :()async{
          await viewModel.showChangeStatusDialog(complainId , title , detail);
        },
        child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: title,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                )),
                          ),
                          RichText(
                            text: TextSpan(
                                text: status,
                                style: TextStyle(
                                  color: viewModel.getStatusColor(status),
                                  fontSize: 20,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(
                            text: detail,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ]))),
      ),
    );
  }
}
