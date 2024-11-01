class UserModel {
  String username;
  String profilePicture;
  String? bio;
  int followers;
  int following;

  UserModel({
    required this.username,
    required this.profilePicture,
    this.bio,
    required this.followers,
    required this.following,
  });
}
