import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/entities/card_entity.dart';

class UserCardRepository {
  final List<CardEntity> _userCards = [
    CardEntity(
        'cc2',
        'CIRCLE K',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnJkiR7ahkh2BETedLL6Vep1bRkhGnl0dHFA&usqp=CAU',
        const Color.fromARGB(255, 207, 65, 55),
        [
          'Quà New Member (welcome kit)',
          'Quà Sinh Nhật',
          'Tích điểm đổi quà',
          'Nhận thông báo về những ưu đãi đặc biệt từ MiniStop'
        ],
        '+ Tích điểm đổi quà (Mỗi 20.000 VND tương đương 1 điểm) + Nhận quà theo hạng thành viên điểm đổi quà (Mỗi 20.000 VND tương đương 1 điểm) + Nhận quà theo hạng thành viên điểm đổi quà (Mỗi 20.000 VND tương đương 1 điểm) + Nhận quà theo hạng thành viên)'),
    CardEntity(
        'cc3',
        'OXFAM',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWogsyyA2i2sb19M5t8UV_0dQd3_UgUGFlQ3hnMYdTXuSXOCyLLWSqbpoH7fWa20_3RQE&usqp=CAU',
        const Color.fromARGB(255, 97, 165, 68),
        [
          'Quà New Member (welcome kit)',
          'Quà Sinh Nhật',
          'Tích điểm đổi quà',
          'Nhận thông báo về những ưu đãi đặc biệt từ MiniStop'
        ],
        '+ Tích điểm đổi quà (Mỗi 20.000 VND tương đương 1 điểm) + Nhận quà theo hạng thành viên điểm đổi quà (Mỗi 20.000 VND tương đương 1 điểm) + Nhận quà theo hạng thành viên điểm đổi quà (Mỗi 20.000 VND tương đương 1 điểm) + Nhận quà theo hạng thành viên)'),
    CardEntity(
        'cc4',
        'NIVEA',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Nivea_logo.svg/2048px-Nivea_logo.svg.png',
        const Color.fromARGB(255, 0, 51, 160),
        [
          'Quà New Member (welcome kit)',
          'Quà Sinh Nhật',
          'Tích điểm đổi quà',
          'Nhận thông báo về những ưu đãi đặc biệt từ MiniStop'
        ],
        '+ Tích điểm đổi quà (Mỗi 20.000 VND tương đương 1 điểm) + Nhận quà theo hạng thành viên điểm đổi quà (Mỗi 20.000 VND tương đương 1 điểm) + Nhận quà theo hạng thành viên điểm đổi quà (Mỗi 20.000 VND tương đương 1 điểm) + Nhận quà theo hạng thành viên)'),
    CardEntity(
        'cc5',
        'OXFAM',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWogsyyA2i2sb19M5t8UV_0dQd3_UgUGFlQ3hnMYdTXuSXOCyLLWSqbpoH7fWa20_3RQE&usqp=CAU',
        const Color.fromARGB(255, 97, 165, 68),
        [
          'Quà New Member (welcome kit)',
          'Quà Sinh Nhật',
          'Tích điểm đổi quà',
          'Nhận thông báo về những ưu đãi đặc biệt từ MiniStop'
        ],
        '+ Tích điểm đổi quà (Mỗi 20.000 VND tương đương 1 điểm) + Nhận quà theo hạng thành viên điểm đổi quà (Mỗi 20.000 VND tương đương 1 điểm) + Nhận quà theo hạng thành viên điểm đổi quà (Mỗi 20.000 VND tương đương 1 điểm) + Nhận quà theo hạng thành viên)')
  ];
  void addUserCard(String userid, String cardId) {
    var card = CardEntity(
        'MECABR0237541',
        'MINISTOP',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaNp78uvRumS8_v7ZzYEoOB0skOEYkY4w7cycV4mJqgg&s',
        const Color.fromARGB(255, 248, 211, 35),
        [
          'Quà New Member (welcome kit)',
          'Quà Sinh Nhật',
          'Tích điểm đổi quà',
          'Nhận thông báo về những ưu đãi đặc biệt từ MiniStop'
        ],
        '+ Tích điểm đổi quà (Mỗi 20.000 VND tương đương 1 điểm) + Nhận quà theo hạng thành viên điểm đổi quà (Mỗi 20.000 VND tương đương 1 điểm) + Nhận quà theo hạng thành viên điểm đổi quà (Mỗi 20.000 VND tương đương 1 điểm) + Nhận quà theo hạng thành viên)');

    try {
      if (cardId == 'MECABR0237541') {
        _userCards.insert(0, card);
      } else {
        throw new Exception();
      }
    } catch (e) {
      throw new Exception();
    }
  }

  List<CardEntity> getCardsByUserId(String id) {
    return _userCards;
  }
}
