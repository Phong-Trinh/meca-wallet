import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OrderAppbar extends StatelessWidget with PreferredSizeWidget {
  const OrderAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      iconTheme: IconThemeData(color: Colors.black),
      title: Text('Đặt hàng',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20)),
      titleSpacing: 16,
      elevation: 0,
      flexibleSpace: Container(
          height: 150,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                    width: 0.2, color: Color.fromARGB(255, 184, 177, 177)),
              ))),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none)),
        SizedBox(width: 15),
        IconButton(onPressed: () {}, icon: Icon(Icons.search))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
