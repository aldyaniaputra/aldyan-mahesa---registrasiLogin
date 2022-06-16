import 'package:get_it/get_it.dart';
import 'package:none/Service/LocationService.dart';
import 'package:none/Service/Navigation.dart';
import 'package:none/Service/api_service.dart';
import 'package:none/Service/geolocatorService.dart';

GetIt locator = GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => geolocatorService());
  locator.registerLazySingleton(() => LocationService());
}