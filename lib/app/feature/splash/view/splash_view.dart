import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netpace/app/feature/shared_widgets/app_logo.dart';
import 'package:netpace/app/feature/splash/viewmodel/splash_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
        onModelReady: (model)async =>await model.initModelView(),
        viewModelBuilder: () => SplashViewModel(),
        builder: ((context, model, child) => Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: AppLogo()),
                  
                ],
              ),
            )));
  }
}
