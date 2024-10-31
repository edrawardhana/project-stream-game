import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/background.jpg'), // Ganti dengan nama file gambar Anda
                fit: BoxFit.cover, // Memastikan gambar menutupi seluruh area
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50), // Spasi atas
                  Text(
                    'Login to Your Account',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Warna teks
                    ),
                  ),
                  SizedBox(height: 40),
                  // Panel Email
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // Sudut membulat
                    ),
                    elevation: 5, // Bayangan
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        onChanged: (value) => controller.email.value = value,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: InputBorder.none, // Tanpa border
                          prefixIcon: Icon(Icons.email),
                          hintText: 'Enter your email',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Panel Password
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // Sudut membulat
                    ),
                    elevation: 5, // Bayangan
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        onChanged: (value) => controller.password.value = value,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: InputBorder.none, // Tanpa border
                          prefixIcon: Icon(Icons.lock),
                          hintText: 'Enter your password',
                        ),
                        obscureText: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Obx(() => controller.isLoading.value
                      ? CircularProgressIndicator()
                      : Container(
                          width: double.infinity, // Lebar penuh
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.blueAccent,
                                Colors.purpleAccent
                              ], // Warna gradien
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius:
                                BorderRadius.circular(30), // Sudut membulat
                            boxShadow: [
                              BoxShadow(
                                color:
                                    Colors.black.withOpacity(0.3), // Bayangan
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3), // Menggeser bayangan
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: controller.login,
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white, // Warna teks tombol
                                fontSize: 18, // Ukuran font
                                fontWeight: FontWeight.bold, // Ketebalan font
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 15), backgroundColor: Colors
                                  .transparent, // Menghilangkan warna latar belakang
                              shadowColor: Colors
                                  .transparent, // Menghilangkan bayangan tombol default
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(30), // Sudut membulat
                              ),
                            ),
                          ),
                        )),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Get.offNamed(
                          '/register'); // Navigasi ke halaman registrasi
                    },
                    child: Text(
                      'Don\'t have an account? Register here',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
