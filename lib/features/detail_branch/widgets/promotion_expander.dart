import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/entities/card_entity.dart';

class PromotionExpander extends StatelessWidget {
  final CardEntity cardItem;
  const PromotionExpander({super.key, required this.cardItem});

  @override
  Widget build(BuildContext context) {
    promotionLst() {
      return ListView(
        padding: const EdgeInsets.only(bottom: 12.0),
        shrinkWrap: true,
        children: <Widget>[
          const Text('Các ưu đãi chính',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 16.2)),
          Container(height: 18),
          ...cardItem.eventDetails.map((e) =>
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  '${cardItem.eventDetails.indexOf(e) + 1}. ',
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w900),
                ), //bullet text
                const SizedBox(
                  width: 12,
                ), //space between bullet and text
                Expanded(
                  child: Text(
                    e,
                    style: const TextStyle(fontSize: 14.6),
                  ), //text
                ),
                Container(height: 22),
              ]))
        ],
      );
    }

    detailPomotion() {
      return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14.00),
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 209, 179, 133),
              borderRadius: BorderRadius.all(Radius.circular(18.0))),
          child: Text(cardItem.eventDescription));
    }

    fullPromotion() {
      return Column(
        children: [promotionLst(), detailPomotion()],
      );
    }

    buildExpanded() {
      return fullPromotion();
    }

    buildCollapsed() {
      return promotionLst();
    }

    showMoreBtn() {
      return Row(children: const <Widget>[
        Text('Xem thêm ưu đãi ',
            style: TextStyle(color: Color.fromARGB(255, 62, 64, 62))),
        Icon(
          Icons.keyboard_arrow_down_sharp,
          color: Color.fromARGB(255, 62, 64, 62),
          size: 24.0,
        )
      ]);
    }

    showLessBtn() {
      return Row(children: const <Widget>[
        Text('Đóng ', style: TextStyle(color: Color.fromARGB(255, 62, 64, 62))),
        Icon(
          Icons.keyboard_arrow_up_sharp,
          color: Color.fromARGB(255, 62, 64, 62),
          size: 24.0,
        )
      ]);
    }

    return ExpandableNotifier(
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(18.0))),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expandable(
              collapsed: buildCollapsed(),
              expanded: buildExpanded(),
            ),
            const Divider(
              height: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Builder(
                  builder: (context) {
                    var controller =
                        ExpandableController.of(context, required: true)!;
                    return TextButton(
                      child:
                          controller.expanded ? showLessBtn() : showMoreBtn(),
                      onPressed: () {
                        controller.toggle();
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
