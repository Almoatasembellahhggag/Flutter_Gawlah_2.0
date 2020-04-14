import 'package:flutter/widgets.dart';
import 'package:flutter_gawlah/locator.dart';
import 'package:flutter_gawlah/models/user.dart';
import 'package:flutter_gawlah/services/authentication_service.dart';



class BaseModel extends ChangeNotifier {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  User get currentUser => _authenticationService.currentUser;

  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
