import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;

  void login() async {
    if (email.value.isEmpty || password.value.isEmpty) {
      Get.snackbar(
        'Error',
        'Email and password cannot be empty',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        margin: EdgeInsets.all(0), // Mengatur margin
        borderRadius: 12, // Sudut tumpul
        isDismissible: true, // Mengizinkan pengguna untuk menutup snackbar
        duration: Duration(seconds: 2), // Durasi snackbar ditampilkan
      );
      return; // Tidak melanjutkan proses login
    }

    isLoading.value = true;

    // Mendapatkan SharedPreferences untuk memeriksa kredensial
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedEmail = prefs.getString('email');
    String? storedPassword = prefs.getString('password');

    // Simulasi proses login
    await Future.delayed(Duration(seconds: 2), () {
      isLoading.value = false;
    });

    // Memeriksa apakah email dan password cocok
    if (email.value == storedEmail && password.value == storedPassword) {
      // Login berhasil
      Get.offNamed('/home');
    } else {
      // Login gagal
      Get.snackbar(
        'Error',
        'Invalid email or password',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        margin: EdgeInsets.all(0), // Mengatur margin
        borderRadius: 12, // Sudut tumpul
        isDismissible: true, // Mengizinkan pengguna untuk menutup snackbar
        duration: Duration(seconds: 2), // Durasi snackbar ditampilkan
      );
    }
  }
}
