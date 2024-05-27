import 'package:e_commerce_app/models/menu_model/menu_response.dart';

class CartResponse {
  final int id;
  final MenuResponse menu;
  final int quantity;
  final double totalPrice;

  CartResponse({
    required this.id,
    required this.menu,
    required this.quantity,
    required this.totalPrice,
  });
}
