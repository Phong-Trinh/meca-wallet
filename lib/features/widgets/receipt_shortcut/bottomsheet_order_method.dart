import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/bloc/order/order_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/bloc/order/order_event.dart';
import '../pop_over.dart';
import 'change_order_method.dart';

class BottomSheetOrderMethod extends StatelessWidget {
  final OrderBloc orderBloc;
  const BottomSheetOrderMethod({super.key, required this.orderBloc});

  @override
  Widget build(BuildContext context) {
    return Popover(
        child: Column(children: [
      Text('Thay đổi phương thức đặt hàng',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
      SizedBox(height: 20),
      GestureDetector(
          onTap: () {
            orderBloc.add(ModifyOrderMethod(1));
            Navigator.pop(context);
          },
          child: ChangeOrderMethod(
            imageUrl: 'assets/images/in-place-icon.png',
            nameMethod: 'Tại Quầy',
            description: 'Đến tại quầy nhận hàng và thanh toán',
          )),
      GestureDetector(
          onTap: () {
            orderBloc.add(ModifyOrderMethod(2));
            Navigator.pop(context);
          },
          child: ChangeOrderMethod(
            imageUrl: 'assets/images/delivery-icon.jpg',
            nameMethod: 'Tại Bàn',
            description: 'Ngồi tại bàn đặt hàng và thanh toán',
          ))
    ]));
  }
}
