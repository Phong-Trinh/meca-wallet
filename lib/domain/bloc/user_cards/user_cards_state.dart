import 'package:equatable/equatable.dart';
import '../../entities/card_entity.dart';

abstract class UserCardsState extends Equatable {
  const UserCardsState();

  @override
  List<Object> get props => [];
}

class UserCardsInitialState extends UserCardsState {}

class UserCardsLoadingState extends UserCardsState {}

class UserCardsLoadSuccess extends UserCardsState {
  final List<CardEntity> userCards;
  const UserCardsLoadSuccess(this.userCards);
}

class UserCardsUpdated extends UserCardsState {}

class UserCardsLoadFailed extends UserCardsState {}
