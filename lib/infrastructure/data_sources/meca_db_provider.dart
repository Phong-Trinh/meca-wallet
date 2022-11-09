import 'dart:ui';
import '../DTO/card_dto.dart';

class MecaDBProvider {
  Future<CardDTO> readCardById(String id) async {
    switch (id) {
      case 'cc1':
        return CardDTO(
            'cc1',
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
      case 'cc2':
        return CardDTO(
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
            '+ Tích điểm đổi quà (Mỗi 20.000 VND tương đương 1 điểm) + Nhận quà theo hạng thành viên điểm đổi quà (Mỗi 20.000 VND tương đương 1 điểm) + Nhận quà theo hạng thành viên điểm đổi quà (Mỗi 20.000 VND tương đương 1 điểm) + Nhận quà theo hạng thành viên)');
      case 'cc3':
        return CardDTO(
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
            '+ Tích điểm đổi quà (Mỗi 20.000 VND tương đương 1 điểm) + Nhận quà theo hạng thành viên điểm đổi quà (Mỗi 20.000 VND tương đương 1 điểm) + Nhận quà theo hạng thành viên điểm đổi quà (Mỗi 20.000 VND tương đương 1 điểm) + Nhận quà theo hạng thành viên)');

      case 'cc4':
        return CardDTO(
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
            '+ Tích điểm đổi quà (Mỗi 20.000 VND tương đương 1 điểm) + Nhận quà theo hạng thành viên điểm đổi quà (Mỗi 20.000 VND tương đương 1 điểm) + Nhận quà theo hạng thành viên điểm đổi quà (Mỗi 20.000 VND tương đương 1 điểm) + Nhận quà theo hạng thành viên)');
      case 'cc5':
        return CardDTO(
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
            '+ Tích điểm đổi quà (Mỗi 20.000 VND tương đương 1 điểm) + Nhận quà theo hạng thành viên điểm đổi quà (Mỗi 20.000 VND tương đương 1 điểm) + Nhận quà theo hạng thành viên điểm đổi quà (Mỗi 20.000 VND tương đương 1 điểm) + Nhận quà theo hạng thành viên)');
    }
    throw Exception('FooException');
  }
}
