import 'package:flutter/material.dart';

class SignInProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  bool isPasswordVisibility = false;
  bool isConfirmPasswordVisibility = false;

  onPasswordVisibale() {
    isPasswordVisibility = !isPasswordVisibility;
    notifyListeners();
  }

  onConfirmPasswordVisibale() {
    isConfirmPasswordVisibility = !isConfirmPasswordVisibility;
    notifyListeners();
  }
}
