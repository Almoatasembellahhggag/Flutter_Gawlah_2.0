

import 'package:flutter/cupertino.dart';
import 'package:flutter_gawlah/Image.dart';
import 'package:flutter_gawlah/home.dart';

import '../constants/route_names.dart';
import '../locator.dart';
import '../services/authentication_service.dart';
import '../services/dialog_service.dart';
import '../services/navigation_service.dart';
import 'package:flutter/foundation.dart';

import 'base_model.dart';

class SignUpViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  String _selectedRole = 'Select a User Role';
  String get selectedRole => _selectedRole;

  void setSelectedRole(dynamic role) {
    _selectedRole = role;
    
    notifyListeners();
  }

  Future signUp({
    @required String email,
    @required String password,
    @required String fullName,
   List<String> likedtours,
   List<String>  likedplaces,
    int review,
    String addcomment,
    String image

  }) async {
    setBusy(true);

    var result = await _authenticationService.signUpWithEmail(
        email: email,
        password: password,
        fullName: fullName,
        role: _selectedRole,
        likedplaces: likedplaces,
        likedtours: likedtours,
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
          title: 'Sign Up Failure',
          description: 'General sign up failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Sign Up Failure',
        description: result,
      );
    }
  }
}