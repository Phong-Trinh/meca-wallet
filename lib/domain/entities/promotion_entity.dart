import 'package:flutter_application_2/domain/entities/product_entity.dart';

class PromotionEntity {
  final String id;
  final String title;
  final String detail;
  final double pricePercents;

  PromotionEntity(this.id, this.title, this.detail, this.pricePercents);
}
