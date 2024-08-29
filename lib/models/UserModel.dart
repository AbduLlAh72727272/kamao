class UserModel {
  final int id;
  final String name;
  final String email;
  final bool activeStatus;
  final String profilePic;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.activeStatus,
    required this.profilePic,
  });

  // Factory method to create a UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      activeStatus: json['activeStatus'],
      profilePic: json['profilePic'],
    );
  }
}
