import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/entities/order_detail_entity.dart';

class ListDetailProduct extends StatelessWidget {
  final List<OrderDetailEntity> details;
  const ListDetailProduct({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                Text('Sản phẩm đã chọn',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                Spacer(),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        height: 30,
                        width: 55,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 243, 227, 214),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Center(
                            child: Text('Thêm',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 212, 93, 3),
                                    fontWeight: FontWeight.w700)))))
              ],
            ),
            SizedBox(height: 25),
            for (var item in details) DetailInforProduct(item: item)
          ],
        ));
  }
}

class DetailInforProduct extends StatelessWidget {
  final OrderDetailEntity item;
  const DetailInforProduct({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 15, bottom: 15, left: 15),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1, color: Color.fromARGB(255, 185, 185, 185)))),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(generateProductName(item),
                    style: TextStyle(fontWeight: FontWeight.w700, height: 2)),
                Text('Vừa',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color.fromARGB(255, 106, 106, 106)))
              ],
            ),
            Spacer(),
            Text(generatePrice(item), style: TextStyle(fontSize: 16))
          ],
        ));
  }

  String generateProductName(OrderDetailEntity item) {
    return item.quantity.toString() + 'x ' + item.product.name;
  }

  String generatePrice(OrderDetailEntity item) {
    return item.totalPrice.toString() + 'đ';
  }
}
