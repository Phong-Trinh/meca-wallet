import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/entities/card_entity.dart';
import '../../point_history/point_history_screen.dart';

class BranchCoverImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 248,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/coffee-shop-cover.png"),
            fit: BoxFit.cover,
          ),
        ));
  }
}
