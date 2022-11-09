import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/entities/card_entity.dart';

class BranchInfor extends StatelessWidget implements PreferredSizeWidget {
  final CardEntity cardItem;
  const BranchInfor({super.key, required this.cardItem});
  @override
  Size get preferredSize => const Size.fromHeight(180);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cardItem.name,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              height: 2,
              wordSpacing: 3),
        ),
        Row(children: [
          Text(
            "Meca's Partner",
            style: TextStyle(
                color: Color.fromARGB(255, 146, 144, 144),
                fontSize: 15,
                fontWeight: FontWeight.w700,
                height: 1.2),
          ),
          SizedBox(width: 8),
          Icon(
            Icons.star_rounded,
            color: Color.fromARGB(255, 221, 166, 27),
          ),
        ])
      ],
    ));
  }
}
