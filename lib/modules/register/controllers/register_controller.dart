import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;
  var isLoading = false.obs;

  void register() async {
    if (email.value.isEmpty || password.value.isEmpty || confirmPassword.value.isEmpty) {
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
      return; // Tidak melanjutkan proses registrasi
    }

    if (password.value != confirmPassword.value) {
      Get.snackbar(
        'Error',
        'Passwords do not match',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        margin: EdgeInsets.all(0), // Mengatur margin
        borderRadius: 12, // Sudut tumpul
        isDismissible: true, // Mengizinkan pengguna untuk menutup snackbar
        duration: Duration(seconds: 2), // Durasi snackbar ditampilkan
      );
      return; // Tidak melanjutkan proses registrasi
    }

    isLoading.value = true;

    // Simulasi proses registrasi
    await Future.delayed(Duration(seconds: 2), () {
      isLoading.value = false;
    });

    // Menyimpan data ke SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email.value);
    await prefs.setString('password', password.value);

    Get.snackbar(
      'Success',
      'Account created successfully!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      margin: EdgeInsets.all(0), // Mengatur margin
      borderRadius: 12, // Sudut tumpul
      isDismissible: true, // Mengizinkan pengguna untuk menutup snackbar
      duration: Duration(seconds: 2), // Durasi snackbar ditampilkan
    );

    // Navigasi ke halaman login setelah registrasi berhasil
    Get.offNamed('/login');
  }
}
