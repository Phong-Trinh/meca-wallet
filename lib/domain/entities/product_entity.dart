import 'category_entity.dart';

class ProductEntity {
  final String id;
  final String name;
  final String imgUrl;
  final int afterPrice;
  final int beforePrice;
  final bool onPromotion;

  ProductEntity(this.id, this.name, this.imgUrl, this.afterPrice,
      this.beforePrice, this.onPromotion);
}
