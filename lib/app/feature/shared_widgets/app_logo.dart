import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'asset.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400.h,
        width: 400.h,
        child: Image.asset('images/logo.png')
        // const Asset(
        //   asset: 'images/help.png',
        // ),
      ),
    );
  }
}
