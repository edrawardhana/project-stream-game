import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find();

    return Scaffold(
      appBar: AppBar(title: Text(controller.user.value.username)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(controller.user.value.profilePicture),
              radius: 50,
            ),
            SizedBox(height: 10),
            Text('Followers: ${controller.user.value.followers}'),
            Text('Following: ${controller.user.value.following}'),
          ],
        ),
      ),
    );
  }
}
