import 'package:flutter/material.dart';

class MyAuthProvider extends ChangeNotifier {
  String? _email;
  String? _password;
  String? _name;
  String? _confirmPassword;


  String? get email => _email;
  set email(String? email) {
    _email = email;
    notifyListeners();
  }


  String? get password => _password;
  set password(String? password) {
    _password = password;
    notifyListeners();
  }

  String? get ConfirmPassword => _confirmPassword;
  set ConfirmPassword(String? password) {
    _confirmPassword = password;
    notifyListeners();
  }

  String? get name => _name;
  set name(String? name) {
    _name = name;
    notifyListeners();
  }
}
