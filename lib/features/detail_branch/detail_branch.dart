import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/bloc/order/order_bloc.dart';
import 'package:flutter_application_2/features/detail_branch/widgets/point_holder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/bloc/order/order_event.dart';
import '../../domain/bloc/order/order_state.dart';
import '../../domain/entities/card_entity.dart';
import '../../infrastructure/repository/order_repository.dart';
import 'widgets/branch-cover-image.dart';
import 'widgets/branch-infor.dart';
import 'widgets/member-progress.dart';
import 'widgets/order_shortcut.dart';
import 'widgets/promotion_shortcut.dart';
import 'widgets/detail-branch-appbar.dart';
import 'widgets/promotion_expander.dart';
import '../widgets/receipt_shortcut/receipt_shortcut.dart';

class DetailBranchScreen extends StatefulWidget {
  final CardEntity cardItem;

  DetailBranchScreen({super.key, required this.cardItem});

  @override
  State<DetailBranchScreen> createState() => _DetailBranchScreenState();
}

class _DetailBranchScreenState extends State<DetailBranchScreen> {
  late ScrollController _scrollController;

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (280 - kToolbarHeight);
  }

  bool get _isTitleExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (280 - (2 * kToolbarHeight) + 130);
  }

  Color _textColor = Colors.white;

  @override
  DetailBranchScreen get widget => super.widget;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _textColor = _isSliverAppBarExpanded ? Colors.white : Colors.blue;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (context) => OrderRepository(),
        child: BlocProvider(
            create: (context) =>
                OrderBloc(orderrepository: context.read<OrderRepository>())
                  ..add(LoadOrderEvent()),
            child: Stack(children: [
              Scaffold(
                  //1
                  body: CustomScrollView(
                controller: _scrollController,
                slivers: <Widget>[
                  //2
                  DetailBranchAppbar(
                      title: widget.cardItem.name,
                      isTitleExpanded: _isTitleExpanded,
                      isSliverAppBarExpanded: _isSliverAppBarExpanded),
                  //3Align
                  SliverPadding(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        BranchInfor(cardItem: widget.cardItem),
                        //SizedBox(height: 36),
                        //PointHolder(cardItem: widget.cardItem),
                        SizedBox(height: 20),
                        OrderShortcut(),
                        SizedBox(height: 36),
                        PromotionShortcut(),
                        Container(height: 3000)
                      ]),
                    ),
                  )
                ],
              )),
              Align(alignment: Alignment.bottomCenter, child: ReceiptShortcut())
            ])));
  }
}
