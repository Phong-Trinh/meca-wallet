import 'package:flutter/material.dart';

class ChangeOrderMethod extends StatelessWidget {
  final String imageUrl;
  final String nameMethod;
  final String description;

  ChangeOrderMethod(
      {super.key,
      required this.nameMethod,
      required this.description,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            margin: EdgeInsets.only(left: 15, right: 10, bottom: 0),
            height: 36,
            width: 36,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.cover,
            )),
          ),
          Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Text(nameMethod,
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                Text(description,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 84, 80, 80)))
              ])),
          Spacer(),
          SizedBox(width: 15)
        ]));
  }
}
