import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/bloc/menu/menu_bloc.dart';
import 'package:flutter_application_2/infrastructure/repository/menu_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/bloc/menu/menu_event.dart';
import '../widgets/receipt_shortcut/receipt_shortcut.dart';
import 'widgets/menu_holder.dart';
import 'widgets/order_appbar.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => OrderScreenState();
}

class OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<MenuRepository>(
        create: (context) => MenuRepository(),
        child: BlocProvider(
            create: (context) =>
                MenuBloc(menuRepository: context.read<MenuRepository>())
                  ..add(LoadMenuEvent()),
            child: Stack(children: [
              Scaffold(
                  resizeToAvoidBottomInset: false,
                  appBar: OrderAppbar(),
                  body: MenuHolder()),
              Align(alignment: Alignment.bottomCenter, child: ReceiptShortcut())
            ])));
  }
}
