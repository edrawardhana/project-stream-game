import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../models/user_model.dart';

class ProfileController extends GetxController {
  var user = UserModel(
    username: '@cat11',
    profilePicture: 'https://linktoimage.com/profile.jpg',
    bio: 'New York, USA',
    followers: 420000,
    following: 95,
  ).obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void logout() async {
    await _auth.signOut();
    Get.offAllNamed('/login');  // Mengarahkan ke halaman login setelah logout
  }
}
