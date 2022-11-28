import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/bloc/order/order_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/bloc/order/order_event.dart';
import '../../order/order_screen.dart';

class OrderShortcut extends StatelessWidget {
  OrderShortcut({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderBloc _orderBloc = BlocProvider.of<OrderBloc>(context);
    return GestureDetector(
        onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return BlocProvider.value(
                    value: _orderBloc, child: OrderScreen());
              }))
            },
        child: Container(
            height: 114,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 45,
                      width: 45,
                      child: Image.asset('assets/images/delivery-icon.jpg'),
                    ),
                    const Text('Giao hàng',
                        style:
                            TextStyle(fontWeight: FontWeight.w500, height: 1.6))
                  ],
                ),
                const VerticalDivider(
                    thickness: 2.4, indent: 20, endIndent: 20, width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 42,
                      width: 42,
                      child: Image.asset('assets/images/in-place-icon.png'),
                    ),
                    const Text('Tại quầy',
                        style:
                            TextStyle(fontWeight: FontWeight.w500, height: 2))
                  ],
                )
              ],
            )));
  }
}
