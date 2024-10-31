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
}
