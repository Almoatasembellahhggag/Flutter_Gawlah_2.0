import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gawlah/profilepage.dart';
import 'package:flutter_gawlah/services/authentication_service.dart';
import 'package:flutter_gawlah/view_models.dart/home_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_gawlah/services/navigation_service.dart';
import 'package:flutter_gawlah/services/dialog_service.dart';
import 'package:flutter_gawlah/services/firestore_service.dart';
GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => FirestoreService());
 //locator.registerLazySingleton(() => ProfilePage());

}