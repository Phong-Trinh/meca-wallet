import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../domain/entities/card_entity.dart';

class MemberProgress extends StatelessWidget {
  final CardEntity cardItem;
  const MemberProgress({super.key, required this.cardItem});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text('THÀNH VIÊN VÀNG'),
            Text('Điểm tích lũy'),
            Text('280'),
          ],
        ),
        Column(
          children: [
            CircularPercentIndicator(
              animationDuration: 1200,
              startAngle: 180,
              radius: 68.0,
              lineWidth: 16.0,
              animation: true,
              percent: 60 / 100,
              center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage:
                          NetworkImage(scale: 0.26, cardItem.logoCardURL),
                    ),
                    Text('60/100')
                  ]),
              backgroundColor: Color.fromARGB(255, 212, 211, 211),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: cardItem.colorCard,
            )
          ],
        )
      ],
    ));
  }
}
