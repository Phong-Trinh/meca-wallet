import 'package:equatable/equatable.dart';

abstract class UserCardsEvent extends Equatable {
  @override
  List<Object?> get props => <Object?>[];
}

class GetUserCards extends UserCardsEvent {
  final String id;

  GetUserCards(this.id);
}

class UpdatedUserCard extends UserCardsEvent {}

class OpenAppSettingsEvent extends UserCardsEvent {}

class RequestCurrentUserCardsEvent extends UserCardsEvent {
  RequestCurrentUserCardsEvent();
}

class RequestLocationServiceEvent extends UserCardsEvent {}

class RequestDefaultUserCardsEvent extends UserCardsEvent {}

class ReturnedFromAppSettingsEvent extends UserCardsEvent {}
