import 'package:flutter/material.dart';
import '../../domain/entities/card_entity.dart';

class BackNavAppbar extends StatelessWidget implements PreferredSizeWidget {
  final PreferredSizeWidget child;

  final CardEntity card;

  const BackNavAppbar({super.key, required this.child, required this.card})
      : super();

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(card.name,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18)),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0))),
        bottom: child);
  }

  @override
  Size get preferredSize => const Size.fromHeight(192);
}
