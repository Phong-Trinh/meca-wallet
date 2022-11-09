import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NotificationArea extends StatelessWidget {
  const NotificationArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 64,
        padding: EdgeInsets.fromLTRB(6, 8, 6, 8),
        margin: EdgeInsets.fromLTRB(14, 10, 14, 30),
        decoration: BoxDecoration(
            color: Color.fromARGB(174, 219, 142, 232),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(
            Icons.info,
            color: Color.fromARGB(255, 64, 23, 93),
            size: 20,
          ),
          SizedBox(width: 12),
          Flexible(
              child: Text(
                  'Hệ thống tự động áp dụng những ưu đãi tốt nhất cho đơn hàng ở bước thanh toán.',
                  style: TextStyle(
                      color: Color.fromARGB(255, 64, 23, 93),
                      fontWeight: FontWeight.w700,
                      fontSize: 16)))
        ]));
  }
}
