import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OutstandingBranchs extends StatelessWidget {
  const OutstandingBranchs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        margin: const EdgeInsets.only(top: 160.0, left: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Thịnh hành hôm nay',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 8),
          Expanded(
              child: ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              for (var i in [10, 2, 4, 5, 7, 4, 30])
                Container(
                    margin: EdgeInsets.only(right: 15),
                    width: 160.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        image: DecorationImage(
                          image:
                              AssetImage("assets/images/coffee-shop-cover.png"),
                          fit: BoxFit.cover,
                        ))),
            ],
          )),
        ]));
  }
}
