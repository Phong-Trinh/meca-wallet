import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/bloc/order/order_bloc.dart';
import 'package:flutter_application_2/domain/entities/order_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/bloc/order/order_state.dart';
import '../pop_over.dart';
import 'bottomsheet_detail_order.dart';
import 'bottomsheet_order_method.dart';
import 'change_order_method.dart';
import 'order_detail_price.dart';
import 'order_list.dart';
import 'botttom_change_order_method.dart';

class ReceiptShortcut extends StatefulWidget {
  const ReceiptShortcut({super.key});

  @override
  State<ReceiptShortcut> createState() => ReceiptShortcutState();
}

class ReceiptShortcutState extends State<ReceiptShortcut>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 2900),
    vsync: this,
  )..reverse();
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0.0, 10),
    end: Offset.zero,
  ).animate(_controller..forward());

  @override
  Widget build(BuildContext context) {
    OrderEntity order = context.read<OrderBloc>().order;
    return SlideTransition(
        position: _offsetAnimation,
        child: BlocProvider.value(
            value: BlocProvider.of<OrderBloc>(context),
            child: BlocBuilder<OrderBloc, OrderState>(
                builder: (BuildContext context, OrderState state) {
              if (state is AddProductItemSuccessState)
                // ignore: curly_braces_in_flow_control_structures
                return GestureDetector(
                    onTap: () {
                      showModalBottomSheet<int>(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context2) {
                          return BottomSheetOrderMethod(
                              orderBloc: BlocProvider.of<OrderBloc>(context));
                        },
                      );
                    },
                    child: Container(
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            border: Border(
                                top: BorderSide(
                                    width: 1,
                                    color:
                                        Color.fromARGB(255, 153, 150, 150)))),
                        height: 70,
                        child: Row(children: [
                          const SizedBox(width: 15),
                          Flexible(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                BottomChangeOrderMethod(
                                    orderMethodId: order.orderMethodId),
                                SizedBox(height: 5),
                                OrderList(
                                    orderList: getStringListOrderName(
                                        context.read<OrderBloc>().order))
                              ])),
                          SizedBox(width: 12),
                          TextButton(
                              onPressed: () {
                                showModalBottomSheet<int>(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context2) {
                                    return BottomSheetDetailOrder(
                                        orderBloc: BlocProvider.of<OrderBloc>(
                                            context));
                                  },
                                );
                              },
                              child: OrderDetailPrice(
                                  itemCount: getTotalItem(order),
                                  totalPrice: getTotalPrice(order))),
                          const SizedBox(width: 15)
                        ])));

              return Container();
            })));
  }

  String getStringListOrderName(OrderEntity order) {
    String listName = '';
    order.orderDetails.forEach((element) {
      listName +=
          'X' + element.quantity.toString() + ' ' + element.product.name + ', ';
    });
    return listName;
  }

  int getTotalItem(OrderEntity order) {
    int count = 0;
    order.orderDetails.forEach((element) {
      count += element.quantity;
    });
    return count;
  }

  String getTotalPrice(OrderEntity order) {
    String price = '';
    int count = 0;
    order.orderDetails.forEach((element) {
      count += element.totalPrice;
    });
    return price = count.toString() + 'đ';
  }
}
