import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UtilitiesBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 128),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(children: [
              SizedBox(
                  width: 56,
                  height: 56,
                  child: Image(
                    image: AssetImage('assets/images/icon-banner1.gif'),
                  )),
              SizedBox(height: 14),
              Text('Tích hợp tiện lợi',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500))
            ]),
            VerticalDivider(indent: 12, endIndent: 76, width: 24, thickness: 2),
            Column(children: [
              SizedBox(
                  width: 56,
                  height: 56,
                  child: Image(
                    image: AssetImage('assets/images/icon-banner2.gif'),
                  )),
              SizedBox(height: 14),
              Text('Ngập tràn ưu đãi',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500))
            ])
          ],
        ));
  }
}
