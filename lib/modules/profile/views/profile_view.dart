import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';
import 'edit_profile_view.dart'; // Import the edit profile view

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find();

    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.purpleAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                // Header Section with Back Button
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () => Get.back(),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Profile',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.logout, color: Colors.white),
                        onPressed: () => controller.logout(),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // Profile Picture and Name with Obx
                Obx(() => CircleAvatar(
                  backgroundImage: NetworkImage(controller.user.value.profilePicture),
                  radius: 50,
                )),
                SizedBox(height: 10),
                Obx(() => Text(
                  controller.user.value.username,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )),
                SizedBox(height: 5),
                Obx(() => Text(
                  controller.user.value.bio ?? "Add a bio...",
                  style: TextStyle(color: Colors.white70),
                )),

                SizedBox(height: 20),

                // Followers and Following Stats with Obx
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Obx(() => Text(
                          '${controller.user.value.followers}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                        Text(
                          'Followers',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                    SizedBox(width: 30),
                    Column(
                      children: [
                        Obx(() => Text(
                          '${controller.user.value.following}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                        Text(
                          'Following',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 20),

                // Buttons for Edit Profile
                ElevatedButton(
                  onPressed: () {
                    // Navigate to EditProfileView
                    Get.to(() => EditProfileView());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  ),
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
