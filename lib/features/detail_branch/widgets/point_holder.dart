import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/entities/card_entity.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../point_history/point_history_screen.dart';

class PointHolder extends StatelessWidget implements PreferredSize {
  final CardEntity cardItem;
  const PointHolder({super.key, required this.cardItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PointHistoryScreen(card: cardItem)),
              )
            },
        child: Stack(children: [
          Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: cardItem.colorCard,
                  border: Border.all(
                      color: const Color.fromARGB(255, 64, 62,
                          62), //                   <--- border color
                      width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(
                          18.0) //                 <--- border radius here
                      )),
              child: Column(
                children: [
                  Expanded(
                      flex: 7,
                      child: Container(
                          padding: EdgeInsets.only(top: 8),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(18.0),
                                  topRight: Radius.circular(
                                      18.0) //                 <--- border radius here
                                  )),
                          child: Row(children: [
                            Container(width: 12),
                            CircularPercentIndicator(
                              animationDuration: 1200,
                              startAngle: 180,
                              radius: 42.0,
                              lineWidth: 10.0,
                              animation: true,
                              percent: 60 / 100,
                              center: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundImage: NetworkImage(
                                          scale: 0.26, cardItem.logoCardURL),
                                    ),
                                  ]),
                              backgroundColor:
                                  Color.fromARGB(255, 212, 211, 211),
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: cardItem.colorCard,
                            ),
                            Spacer(),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Trịnh Quốc Phong',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20)),
                                  Row(children: const [
                                    Text('280' + ' điểm',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            height: 2,
                                            fontSize: 16)),
                                  ])
                                ]),
                            SizedBox(width: 12)
                          ]))),
                  Expanded(
                      flex: 3,
                      child: Container(
                          decoration: BoxDecoration(
                              color: cardItem.colorCard,
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(18.0),
                                  bottomRight: Radius.circular(
                                      18.0) //                 <--- border radius here
                                  )),
                          child: Row(mainAxisSize: MainAxisSize.max, children: [
                            Container(width: 16),
                            Text(cardItem.name,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12)),
                            const Spacer(),
                            const Text('created at 12/12/2022',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12)),
                            Container(width: 16),
                          ])))
                ],
              )),
          Positioned(
              top: 1,
              right: 16,
              child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 218, 165, 32),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(3.0),
                          bottomRight: Radius.circular(3))),
                  padding: EdgeInsets.only(left: 4),
                  height: 36,
                  width: 74,
                  child: Text('Gold member',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          height: 1.2))))
        ]));
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
