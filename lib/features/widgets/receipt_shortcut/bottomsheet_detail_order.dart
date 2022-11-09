import 'package:flutter/material.dart';

import '../../../domain/bloc/order/order_bloc.dart';
import '../pop_over.dart';
import 'confirm_bar.dart';
import 'detail_products.dart';
import 'order_method.dart';
import 'total_price.dart';

class BottomSheetDetailOrder extends StatelessWidget {
  final OrderBloc orderBloc;
  const BottomSheetDetailOrder({super.key, required this.orderBloc});

  @override
  Widget build(BuildContext context) {
    return Popover(
        child: Container(
            color: Color.fromARGB(255, 210, 209, 209),
            height: MediaQuery.of(context).size.height - 30,
            child: Stack(
              children: [
                ListView(children: [
                  SizedBox(height: 45),
                  ListDetailProduct(details: orderBloc.order.orderDetails),
                  SizedBox(height: 25),
                  OrderMethod(orderBloc: orderBloc),
                  SizedBox(height: 25),
                  TotalPrice(order: orderBloc.order),
                  SizedBox(height: 100),
                ]),
                Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                        height: 25,
                        width: double.infinity,
                        color: Colors.white,
                        child: Center(
                            child: Text('Xác nhận đơn hàng',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700))))),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: ConfirmBar(orderBloc: orderBloc))
              ],
            )));
  }
}
