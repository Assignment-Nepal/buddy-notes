

import 'package:get_it/get_it.dart';
import 'package:safar_frontend/route/routes.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(()=> DynamicNavigationService());

}
