import 'package:flutter/material.dart';
import 'widgets/bardcode_sprint.dart';
import 'widgets/cards_holder.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: const Text(
                        'Thẻ thành viên của tôi',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                        textAlign: TextAlign.start,
                      )),
                  Container(
                      margin: const EdgeInsets.only(top: 6),
                      child: const Text('Thêm thẻ thành viên')),
                  Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: CardsHolder()),
                  Container(
                      color: Colors.red, child: const SizedBox(height: 180))
                ],
              ))),
    );
  }
}
