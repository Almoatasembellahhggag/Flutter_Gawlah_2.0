import 'package:flutter_gawlah/ui/views/create_post_view.dart';
import 'package:flutter_gawlah/view_models.dart/create_pos_view_model.dart';

import '../constants/route_names.dart';
import '../locator.dart';
import '../services/authentication_service.dart';
import '../services/dialog_service.dart';
import '../services/navigation_service.dart';
import 'package:flutter/foundation.dart';

import 'base_model.dart';


class LoginViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future login({
    @required String email,
    @required String password,
   String fullName,
   List<String> likedtours,
   List<String>  likedplaces,
    int review,
    String addcomment,
    String image
  }) async {
    setBusy(true);

    var result = await _authenticationService.loginWithEmail(
      email: email,
      password: password,
      fullName: fullName,
      likedtours: likedtours,
      likedplaces: likedplaces,
      review: review,
      addcomment: addcomment,
      image: image

    );

    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.navigateTo(TourList2Route);
      } else {
        await _dialogService.showDialog(
          title: 'Login Failure',
          description: 'General login failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Login Failure',
        description: result,
      );
    }
  }

  void navigateToSignUp() {
    _navigationService.navigateTo(SignUpViewRoute);
  }
}