import 'package:flutter/material.dart';
import '../../../domain/entities/card_entity.dart';

class HistoryPointHolder extends StatelessWidget implements PreferredSize {
  final CardEntity card;
  const HistoryPointHolder({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 64,
        margin: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 42.0),
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromARGB(
                    255, 64, 62, 62), //                   <--- border color
                width: 1),
            borderRadius: const BorderRadius.all(
                Radius.circular(18.0) //                 <--- border radius here
                )),
        child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(18.0))),
            child: Row(children: [
              Container(width: 12),
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(scale: 0.26, card.logoCardURL),
              ),
              Container(width: 14),
              const Text('0',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: 18))
            ])));
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
