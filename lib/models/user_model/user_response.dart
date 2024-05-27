class UserResponse {
  final int id;
  final String fullName;
  final String userName;
  final String email;
  final String password;
  final String profileImage;
  final String locationName;
  final String headLineBio;
  final String gender;
  final String membershipLevel; // New field
  final bool onlineStatus;
  final bool keepSignedIn;
  final bool emailMarketing;
  final int totalOrders;

  UserResponse({
    required this.id,
    required this.fullName,
    required this.userName,
    required this.email,
    required this.password,
    required this.profileImage,
    required this.locationName,
    required this.headLineBio,
    required this.gender,
    required this.membershipLevel, // New field
    required this.onlineStatus,
    required this.keepSignedIn,
    required this.emailMarketing,
    required this.totalOrders,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      id: json['id'],
      fullName: json['name'],
      userName: json['user_name'] ?? '',
      email: json['email'],
      password: json['name'],
      profileImage: json['profile_image'],
      locationName: json['location_name'],
      headLineBio: json['head_line_bio'],
      gender: json['gender'],
      membershipLevel: json['membership_level'],
      onlineStatus: json['online_status'],
      keepSignedIn: json['keep_signed_in'],
      emailMarketing: json['email_marketing'],
      totalOrders: json['total_orders'],
    );
  }
  
}
