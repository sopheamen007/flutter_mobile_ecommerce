class RestaurantResponse {
  final int id;
  final String name;
  final String cuisineType;
  final String location;
  final String detailAddress;
  final String phone;
  final String email;
  final String website;
  final double rating;
  final String profileImage;
  final String coverImage;
  final String bio;
  final bool isOpen;
  final bool hasDelivery;

  RestaurantResponse({
    required this.id,
    required this.name,
    required this.cuisineType,
    required this.location,
    required this.detailAddress,
    required this.phone,
    required this.email,
    required this.website,
    required this.rating,
    required this.profileImage,
    required this.coverImage,
    required this.bio,
    required this.isOpen,
    required this.hasDelivery,
  });

  factory RestaurantResponse.fromJson(Map<String, dynamic> json) {
    return RestaurantResponse(
      id: json['id'],
      name: json['name'],
      cuisineType: json['cuisine_type'],
      location: json['location'],
      detailAddress: json['detail_address'],
      phone: json['phone'],
      email: json['email'],
      website: json['website'],
      rating: json['rating'] != null ? double.parse(json['rating']) : 0.0,
      profileImage: json['profile_image'],
      coverImage: json['cover_image'],
      bio: json['bio'],
      isOpen: json['is_open'] == 1 ? true : false,
      hasDelivery: json['has_delivery'] == 1 ? true : false,
    );
  }

}
