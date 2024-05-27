class User {
  final int id;
  final String name;
  final String email;
  final String? locationName;
  final String? profileImage;

  User({
    required this.id, 
    required this.name, 
    required this.email, 
    this.locationName, 
    this.profileImage
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      profileImage: json['profile_image'],
      locationName: json['location_name'],
    );
  }
}
