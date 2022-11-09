import 'package:flutter_application_2/domain/entities/order_detail_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../infrastructure/repository/order_repository.dart';
import '../../entities/order_entity.dart';
import '../../entities/product_entity.dart';
import 'order_event.dart';
import 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  //pass value to state to reponse to UI

  OrderBloc({required OrderRepository orderrepository})
      : _orderrepository = orderrepository,
        super(OrderInitialState()) {
    on<LoadOrderEvent>((event, emit) async {
      emit(OrderLoadingState());
      try {
        //call repository to get local saved order, if have nothing create new order
        emit(OrderLoadSuccessState(order));
      } catch (e) {
        //do something
        emit(OrderLoadFailState());
      }
    });
    on<AddProductItem>((event, emit) async {
      try {
        //do something
        print("here's the data : ${event.product.name}");
        addProduct(event.product);
        emit(AddProductItemSuccessState(order));
      } catch (e) {
        //do something
        emit(AddProductItemFailState());
      }
    });
    on<IncreaseProductItem>((event, emit) async {
      //do and emit something
      print("here's the data :");
    });

    on<DecreaseProductItem>((event, emit) async {
      //do and emit something
    });

    on<EmitOrder>((event, emit) async {
      //do and emit something
    });

    on<CancelOrder>((event, emit) async {
      //do and emit something
    });

    on<ModifyOrderMethod>((event, mit) async {
      order.orderMethodId = event.methodId;
      emit(AddProductItemSuccessState(order));
    });
  }

  OrderEntity order = OrderEntity(DateTime.now(), 0, [], 0, 0, 1);
  final OrderRepository _orderrepository;

  void addProduct(ProductEntity product) {
    bool checkDuplicate = false;
    print('1');
    order.orderDetails.forEach((element) {
      print('2');
      if (element.product.name == product.name) {
        checkDuplicate = true;
        element.quantity += 1;
        element.totalPrice += product.afterPrice;
      }
    });

    if (checkDuplicate == false) {
      print('3');
      order.orderDetails.add(OrderDetailEntity(product, 1, product.afterPrice));
    }
  }
}
