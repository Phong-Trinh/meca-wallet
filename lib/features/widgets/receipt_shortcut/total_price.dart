import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/entities/order_entity.dart';

class TotalPrice extends StatelessWidget {
  final OrderEntity order;
  const TotalPrice({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text('Tổng cộng',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            SizedBox(height: 25),
            DetailPrice(title: 'Thành tiền', price: generatePrice(order)),
            DetailPrice(title: 'Giảm giá', price: '0đ'),
            PayPrice(title: 'Số tiền thanh toán', price: generatePrice(order))
          ],
        ));
  }

  String generatePrice(OrderEntity order) {
    int total = 0;
    order.orderDetails.forEach((element) {
      total += element.totalPrice;
    });
    return total.toString() + 'đ';
  }
}

class DetailPrice extends StatelessWidget {
  final String title;
  final String price;
  const DetailPrice({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1, color: Color.fromARGB(255, 185, 185, 185)))),
        child: Row(
          children: [
            Text(title, style: TextStyle(height: 2)),
            Spacer(),
            Text(price, style: TextStyle(fontSize: 16))
          ],
        ));
  }
}

class PayPrice extends StatelessWidget {
  final String title;
  final String price;
  const PayPrice({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1, color: Color.fromARGB(255, 185, 185, 185)))),
        child: Row(
          children: [
            Text(title,
                style: TextStyle(fontWeight: FontWeight.w700, height: 2)),
            Spacer(),
            Text(price, style: TextStyle(fontSize: 16))
          ],
        ));
  }
}
