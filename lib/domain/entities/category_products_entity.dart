import 'package:flutter_application_2/domain/entities/category_entity.dart';

import 'product_entity.dart';

class CategoryProductsEntity {
  final CategoryEntity category;
  final List<ProductEntity> products;

  CategoryProductsEntity(this.category, this.products);
}
