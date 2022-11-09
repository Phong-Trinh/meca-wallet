import 'order_detail_entity.dart';
import 'promotion_entity.dart';

class OrderEntity {
  final List<OrderDetailEntity> orderDetails;
  final DateTime dateTime;
  int orderMethodId;
  final int beforePrice;
  final int promotionPrice;
  final int totalPrice;

  OrderEntity(this.dateTime, this.totalPrice, this.orderDetails,
      this.beforePrice, this.promotionPrice, this.orderMethodId);
}
