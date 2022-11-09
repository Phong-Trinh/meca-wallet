import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PromotionDate extends StatelessWidget {
  const PromotionDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        SizedBox(width: 20),
        Icon(Icons.access_time_filled_rounded),
        SizedBox(width: 8),
        Text('Khuyến mãi có hạn',
            style: TextStyle(
                fontWeight: FontWeight.w700, wordSpacing: 1.6, fontSize: 16))
      ],
    ));
  }
}
