import 'package:equatable/equatable.dart';

abstract class QRScanningEvent extends Equatable {
  @override
  List<Object?> get props => <Object?>[];
}

class CheckQRCode extends QRScanningEvent {
  final String userId;
  final String code;

  CheckQRCode(this.userId, this.code);
}

class RefreshState extends QRScanningEvent {}
