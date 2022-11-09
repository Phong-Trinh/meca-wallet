import 'package:flutter_application_2/infrastructure/repository/menu_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'menu_event.dart';
import 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc({required MenuRepository menuRepository})
      : _menuRepository = menuRepository,
        super(MenuInitialState()) {
    on<LoadMenuEvent>((event, emit) async {
      emit(MenuLoadingState());
      try {
        //do something
        await Future.delayed(const Duration(seconds: 1));
        var products = _menuRepository.getAllProduct();
        emit(MenuLoadSuccessState(products));
      } catch (e) {
        //do something
        emit(MenuLoadFailState());
      }
    });
  }

  final MenuRepository _menuRepository;
}
