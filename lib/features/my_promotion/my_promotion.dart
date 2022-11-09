import 'package:flutter/material.dart';
import 'widgets/notification_area.dart';
import 'widgets/promotion_list.dart';

class MyPromotion extends StatelessWidget {
  const MyPromotion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 70,
            elevation: 0,
            backgroundColor: Colors.white,
            title: Text('Ưu đãi dành cho bạn'),
            titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w700,
                height: 2,
                wordSpacing: 1.6),
            iconTheme: IconThemeData(color: Colors.black, size: 28)),
        body: SingleChildScrollView(
            child: Column(
          children: [NotificationArea(), PromotionList()],
        )));
  }
}
