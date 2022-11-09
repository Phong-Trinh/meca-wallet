import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/bloc/order/order_bloc.dart';
import '../../../domain/bloc/order/order_state.dart';
import 'bottomsheet_order_method.dart';
import 'change_order_method.dart';

class OrderMethod extends StatelessWidget {
  final OrderBloc orderBloc;
  const OrderMethod({super.key, required this.orderBloc});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: orderBloc,
        child: BlocBuilder<OrderBloc, OrderState>(
            builder: (BuildContext context, OrderState state) {
          return Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text('Phương thức đặt hàng',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700)),
                      Spacer(),
                      GestureDetector(
                          onTap: () {
                            showModalBottomSheet<int>(
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context2) {
                                return BottomSheetOrderMethod(
                                    orderBloc: orderBloc);
                              },
                            );
                          },
                          child: Container(
                              height: 30,
                              width: 65,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 243, 227, 214),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: Center(
                                  child: Text('Thay đổi',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color:
                                              Color.fromARGB(255, 212, 93, 3),
                                          fontWeight: FontWeight.w700)))))
                    ],
                  ),
                  SizedBox(height: 25),
                  orderBloc.order.orderMethodId == 1
                      ? ChangeOrderMethod(
                          imageUrl: 'assets/images/in-place-icon.png',
                          nameMethod: 'Tại Quầy',
                          description: 'Đến tại quầy nhận hàng và thanh toán',
                        )
                      : ChangeOrderMethod(
                          imageUrl: 'assets/images/delivery-icon.jpg',
                          nameMethod: 'Tại Bàn',
                          description: 'Ngồi tại bàn đặt hàng và thanh toán',
                        )
                ],
              ));
        }));
  }
}
