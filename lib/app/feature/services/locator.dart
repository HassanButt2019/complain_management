import 'package:get_it/get_it.dart';
import 'package:netpace/app/feature/api_service/auth_service.dart';
import 'package:netpace/app/feature/api_service/complain_service.dart';
import 'package:stacked_services/stacked_services.dart';


final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => ComplainService());

}
