import '../constants/route_names.dart';
import '../locator.dart';
import '../services/authentication_service.dart';
import '../services/navigation_service.dart';
import 'package:flutter_gawlah/view_models.dart/base_model.dart';

class SignOutViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future signout() async {
    var hasLoggedInUser = await _authenticationService.isUserLoggedIn();

  if (hasLoggedInUser) {
      
  signout();
       _navigationService.navigateTo(LoginViewRoute);
    } else {
     _navigationService.navigateTo(LoginViewRoute);
   }
  }
}