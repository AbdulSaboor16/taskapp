import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // Username and password text controllers
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  void login() {
    if (username.text.isEmpty || password.text.isEmpty) {
      // Show error
      Get.snackbar('Error', 'Please fill all fields',
          snackPosition: SnackPosition.BOTTOM);
    } else if (username.text == "admin" && password.text == "admin") {
      Get.toNamed('/home'); // Navigate to home screen
    } else {
      // Show error
      Get.snackbar('Error', 'Please enter correct credentials',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
