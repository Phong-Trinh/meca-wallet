import 'package:flutter_application_2/domain/entities/user_entity.dart';
import 'card_entity.dart';

class UserCardEntity {
  final UserEntity user;
  final CardEntity card;
  final int pointMember;
  final DateTime dateRegister;

  UserCardEntity(this.user, this.card, this.pointMember, this.dateRegister);
}
