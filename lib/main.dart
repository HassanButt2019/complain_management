import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';
import 'app/config/routes.dart'as routes;
import "app/config/router.dart"as router;
import 'initializers.dart';

void main() async{
  await initializeRvRentApplication();
  runApp(const NetpaceApplication());
}



class NetpaceApplication extends StatelessWidget {
  const NetpaceApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Netpace Application',
            themeMode: ThemeMode.light,
            navigatorKey: StackedService.navigatorKey!,
            scaffoldMessengerKey:snackbarKey,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: router.generateRoute,
            initialRoute: routes.splashView,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            builder: (context, child) {
              return child!;
            },
          );
        });
  }
}