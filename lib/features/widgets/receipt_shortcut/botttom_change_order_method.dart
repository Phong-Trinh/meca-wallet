import 'package:flutter/material.dart';

class BottomChangeOrderMethod extends StatelessWidget {
  final int orderMethodId;
  const BottomChangeOrderMethod({super.key, required this.orderMethodId});

  @override
  Widget build(BuildContext context) {
    if (orderMethodId == 1)
      return Row(children: [
        Container(
          margin: EdgeInsets.only(right: 5, bottom: 4),
          height: 18,
          width: 18,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/in-place-icon.png"),
            fit: BoxFit.cover,
          )),
        ),
        DefaultTextStyle(
            style: TextStyle(
                color: Color.fromARGB(255, 57, 56, 56),
                fontWeight: FontWeight.w600,
                fontSize: 14),
            child: Text('Tại quầy'))
      ]);

    return Row(children: [
      Container(
        margin: EdgeInsets.only(right: 5, bottom: 0),
        height: 28,
        width: 28,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/delivery-icon.jpg"),
          fit: BoxFit.cover,
        )),
      ),
      DefaultTextStyle(
          style: TextStyle(
              color: Color.fromARGB(255, 57, 56, 56),
              fontWeight: FontWeight.w600,
              fontSize: 14),
          child: Text('Mang tới'))
    ]);
  }
}
