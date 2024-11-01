import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../models/user_model.dart';

class ProfileController extends GetxController {
  var user = UserModel(
    username: '',
    profilePicture: 'https://pbs.twimg.com/media/FcQIMAmakAAbDgo.png',
    bio: '',
    followers: 420000,
    following: 95,
  ).obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  void logout() async {
    await _auth.signOut();
    Get.offAllNamed('/login');
  }

  Future<void> fetchUserData() async {
    try {
      final uid = _auth.currentUser?.uid;
      if (uid != null) {
        final userDoc = await _firestore.collection('users').doc(uid).get();
        if (userDoc.exists) {
          final userData = userDoc.data();
          if (userData != null) {
            user.update((user) {
              if (user != null) {
                user.username = userData['username'] ?? '';
                user.bio = userData['bio'] ?? '';
                user.profilePicture = userData['profilePicture'] ?? '';
              }
            });
            print("Fetched user data: ${user.value.username}");  // Log untuk konfirmasi
          } else {
            print("User data is null.");
          }
        } else {
          print("Document does not exist for user.");
        }
      } else {
        print("No user is currently logged in.");
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }

  Future<void> updateUserProfile(String username, String bio, String profilePicture) async {
    try {
      final uid = _auth.currentUser?.uid;
      if (uid != null) {
        final userDoc = _firestore.collection('users').doc(uid);
        await userDoc.set({
          'username': username,
          'bio': bio,
          'profilePicture': profilePicture,
        }, SetOptions(merge: true));

        // Update user model locally
        user.update((user) {
          if (user != null) {
            user.username = username;
            user.bio = bio;
            user.profilePicture = profilePicture;
          }
        });
      }
    } catch (e) {
      print("Error updating profile: $e");
    }
  }
}
