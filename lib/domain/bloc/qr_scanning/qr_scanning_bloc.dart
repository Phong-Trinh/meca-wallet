import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../infrastructure/repository/user_card_repository.dart';
import 'qr_scanning_event.dart';
import 'qr_scanning_state.dart';

class QRScanningBloc extends Bloc<QRScanningEvent, QRScanningState> {
  //pass value to state to reponse to UI

  QRScanningBloc({required UserCardRepository userCardRepository})
      : _userCardRepository = userCardRepository,
        super(QRScanInitialState()) {
    log('jejejeje');
    on<CheckQRCode>((event, emit) async {
      await Future.delayed(const Duration(seconds: 1));
      if (event.code.startsWith('MECABR')) {
        try {
          userCardRepository.addUserCard(event.userId, event.code);
          emit(QRScanSuccess());
        } catch (e) {
          emit(QRScanFail());
        }
      } else {
        emit(QRScanFail());
      }
    });
    on<RefreshState>((event, emit) async {
      emit(QRScanInitialState());
    });
  }

  final UserCardRepository _userCardRepository;
}
