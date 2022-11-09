import 'package:flutter/material.dart';
import '../../domain/entities/user_entity.dart';

class UserRepository {
  UserEntity fetchUserById(String id) {
    return UserEntity('0172612386543', 'Trnh Quo PHong');
  }
}
