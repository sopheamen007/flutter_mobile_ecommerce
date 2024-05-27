import 'package:e_commerce_app/models/user_model/user_response.dart';

class VoucherResponse {
  final int id;
  final UserResponse user;
  final String code;
  final double discount;
  final String description;
  final DateTime expiryDate;

  VoucherResponse({
    required this.id,
    required this.user,
    required this.code,
    required this.discount,
    required this.description,
    required this.expiryDate,
  });
}
