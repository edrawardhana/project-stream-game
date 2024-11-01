import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class EditProfileView extends StatelessWidget {
  final ProfileController controller = Get.find();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  EditProfileView() {
    // Initialize text controllers with the current user data
    usernameController.text = controller.user.value.username;
    bioController.text = controller.user.value.bio ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Username field
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: "Username"),
            ),
            SizedBox(height: 16),
            // Bio field
            TextField(
              controller: bioController,
              decoration: InputDecoration(labelText: "Bio"),
            ),
            SizedBox(height: 16),
            // Save button
            ElevatedButton(
              onPressed: () async {
                await controller.updateUserProfile(
                  usernameController.text,
                  bioController.text,
                  controller.user.value.profilePicture,
                );
                Get.back(); // Return to ProfileView
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
              ),
              child: Text("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }
}
