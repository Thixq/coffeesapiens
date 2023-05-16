import 'dart:math';

class FormValidate {
  FormValidate._();
  static FormValidate? _instance;
  static FormValidate get instance {
    _instance ??= FormValidate._();
    return _instance!;
  }

  bool EmailValidate(String email) {
    RegExp emailValidate = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{1,256}$');
    return emailValidate.hasMatch(email);
  }
}
