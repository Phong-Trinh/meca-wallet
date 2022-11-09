import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/widgets/shimmer_loading/card_list_item.dart';

class ShimmerProduct extends StatelessWidget {
  const ShimmerProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 20, left: 16, right: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 16),
          for (var i in [1, 2, 3, 4, 5, 6, 7])
            Container(
                margin: EdgeInsets.only(top: 12),
                height: 130,
                child: CardListItem())
        ]));
  }
}
