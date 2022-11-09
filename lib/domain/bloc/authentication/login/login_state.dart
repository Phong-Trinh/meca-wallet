import 'package:equatable/equatable.dart';

import '../../../entities/user_entity.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final UserEntity user;
  const LoginSuccessState(this.user);
}

class LoginFailedState extends LoginState {}
