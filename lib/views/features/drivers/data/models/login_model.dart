import 'package:flutter/cupertino.dart';

class LoginModel {
  TextEditingController? userName;
  TextEditingController? password;

  LoginModel() {
    userName = TextEditingController();
    password = TextEditingController();
  }
}
