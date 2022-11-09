import 'package:flutter_application_2/domain/entities/product_entity.dart';

class OrderDetailEntity {
  final ProductEntity product;
  int quantity;
  int totalPrice;

  OrderDetailEntity(this.product, this.quantity, this.totalPrice);
}
