import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;
  var isLoading = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void register() async {
    if (email.value.isEmpty || password.value.isEmpty || confirmPassword.value.isEmpty) {
      Get.snackbar(
        'Error',
        'Email and password cannot be empty',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        margin: EdgeInsets.all(0),
        borderRadius: 12,
        isDismissible: true,
        duration: Duration(seconds: 2),
      );
      return;
    }

    if (password.value != confirmPassword.value) {
      Get.snackbar(
        'Error',
        'Passwords do not match',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        margin: EdgeInsets.all(0),
        borderRadius: 12,
        isDismissible: true,
        duration: Duration(seconds: 2),
      );
      return;
    }

    isLoading.value = true;

    try {
      // Melakukan registrasi dengan Firebase
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );

      isLoading.value = false;

      Get.snackbar(
        'Success',
        'Account created successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        margin: EdgeInsets.all(0),
        borderRadius: 12,
        isDismissible: true,
        duration: Duration(seconds: 2),
      );

      // Navigasi ke halaman login setelah registrasi berhasil
      Get.offNamed('/login');
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Error',
        'Registration failed: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        margin: EdgeInsets.all(0),
        borderRadius: 12,
        isDismissible: true,
        duration: Duration(seconds: 2),
      );
    }
  }
}
