import 'package:equatable/equatable.dart';
import 'package:flutter_application_2/domain/entities/product_entity.dart';

abstract class OrderEvent extends Equatable {
  @override
  List<Object?> get props => <Object?>[];
}

class LoadOrderEvent extends OrderEvent {}

class AddProductItem extends OrderEvent {
  final ProductEntity product;

  AddProductItem(this.product);
}

class IncreaseProductItem extends OrderEvent {}

class ModifyOrderMethod extends OrderEvent {
  final int methodId;

  ModifyOrderMethod(this.methodId);
}

class DecreaseProductItem extends OrderEvent {}

class EmitOrder extends OrderEvent {}

class CancelOrder extends OrderEvent {}
