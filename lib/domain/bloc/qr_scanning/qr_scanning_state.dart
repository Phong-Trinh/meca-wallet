import 'package:equatable/equatable.dart';
import '../../entities/card_entity.dart';

abstract class QRScanningState extends Equatable {
  const QRScanningState();

  @override
  List<Object> get props => [];
}

class QRScanInitialState extends QRScanningState {}

class QRScanSuccess extends QRScanningState {}

class QRScanFail extends QRScanningState {}
