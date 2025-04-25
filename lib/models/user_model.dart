class UserModel {
  final String name;
  final String username;
  final String email;
  final String phone;
  final String? profileImage;

  UserModel({
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    this.profileImage,
  });
} 