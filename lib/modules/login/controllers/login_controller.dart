import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void login() async {
    if (email.value.isEmpty || password.value.isEmpty) {
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

    isLoading.value = true;

    try {
      // Melakukan login dengan Firebase
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );

      isLoading.value = false;

      // Jika login berhasil, arahkan ke halaman home
      Get.offNamed('/home');
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Error',
        'Invalid email or password',
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
