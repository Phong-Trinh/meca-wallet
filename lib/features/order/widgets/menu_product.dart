import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/bloc/order/order_bloc.dart';
import 'package:flutter_application_2/domain/entities/category_products_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/bloc/order/order_event.dart';

class MenuProduct extends StatelessWidget {
  const MenuProduct({super.key, required this.categories});

  final List<CategoryProductsEntity> categories;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 20, left: 16, right: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          for (var category in categories) ...[
            if (category.products.length > 0)
              Text(category.category.name,
                  style: TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 20, height: 4)),
            for (var item in category.products)
              Container(
                  margin: EdgeInsets.only(top: 12),
                  height: 130,
                  child: Stack(children: [
                    Row(
                      children: [
                        ClipRRect(
                            borderRadius:
                                BorderRadius.circular(3), // Image border
                            child: SizedBox.fromSize(
                                size: Size.fromRadius(65), // Image radius
                                child: Image.network(item.imgUrl,
                                    fit: BoxFit.cover))),
                        SizedBox(width: 12),
                        Container(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              Text(item.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      height: 1.8)),
                              Text(item.afterPrice.toString() + 'đ',
                                  style: TextStyle(fontSize: 16, height: 1.4))
                            ]))
                      ],
                    ),
                    GestureDetector(
                        onTap: () {
                          context.read<OrderBloc>().add(AddProductItem(item));
                        },
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                                margin: EdgeInsets.only(bottom: 10, right: 10),
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(255, 234, 146, 57)),
                                child: Icon(Icons.add, color: Colors.white))))
                  ]))
          ]
        ]));
  }
}
