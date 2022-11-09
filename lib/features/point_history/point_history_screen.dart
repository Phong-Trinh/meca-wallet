import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/entities/card_entity.dart';
import '../widgets/back_navigation_appbar.dart';
import 'widgets/history_point_holder.dart';

class PointHistoryScreen extends StatelessWidget {
  final CardEntity card;
  const PointHistoryScreen({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 238, 241, 255),
        appBar:
            BackNavAppbar(card: card, child: HistoryPointHolder(card: card)),
        body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.only(
                    left: 14, right: 14, top: 14, bottom: 128),
                child: const Center(
                    child: Text(
                  'Chưa có lịch sử tích điểm',
                  textAlign: TextAlign.center,
                )))));
  }
}
