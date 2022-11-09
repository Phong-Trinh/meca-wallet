import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../infrastructure/repository/user_card_repository.dart';
import 'user_cards_event.dart';
import 'user_cards_state.dart';

class UserCardsBloc extends Bloc<UserCardsEvent, UserCardsState> {
  //pass value to state to reponse to UI

  UserCardsBloc({required UserCardRepository userCardRepository})
      : _userCardRepository = userCardRepository,
        super(UserCardsInitialState()) {
    on<GetUserCards>((event, emit) async {
      emit(UserCardsLoadingState());
      await Future.delayed(const Duration(seconds: 1));
      try {
        var userCards = _userCardRepository.getCardsByUserId(event.id);
        emit(UserCardsLoadSuccess(userCards));
      } catch (e) {
        emit(UserCardsLoadFailed());
      }
    });
    on<UpdatedUserCard>((event, emit) async {
      emit(UserCardsUpdated());
    });
  }

  final UserCardRepository _userCardRepository;
}
