import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/bloc/qr_scanning/qr_scanning_bloc.dart';
import 'package:flutter_application_2/domain/bloc/qr_scanning/qr_scanning_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../../infrastructure/repository/user_card_repository.dart';
import 'dart:io';
import 'dart:developer';

import '../../domain/bloc/authentication/login/login_bloc.dart';
import '../../domain/bloc/authentication/login/login_state.dart';
import '../../domain/bloc/qr_scanning/qr_scanning_event.dart';
import '../../domain/bloc/user_cards/user_cards_bloc.dart';
import '../../domain/bloc/user_cards/user_cards_event.dart';

class QRViewScreen extends StatefulWidget {
  const QRViewScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewState();
}

class _QRViewState extends State<QRViewScreen> {
  late QRScanningBloc _qrScanningBloc;
  late UserCardsBloc _userCardsBloc;

  Barcode? result;
  QRViewController? controller;
  late LoginSuccessState userState;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void initState() {
    userState = BlocProvider.of<LoginBloc>(context).state as LoginSuccessState;
    _userCardsBloc = context.read<UserCardsBloc>();
    _qrScanningBloc = QRScanningBloc(
        userCardRepository: RepositoryProvider.of<UserCardRepository>(context));
    _qrScanningBloc.stream.listen((state) => {
          if (state is QRScanSuccess)
            {
              _userCardsBloc.add(GetUserCards(userState.user.id)),
              Navigator.pop(context)
            }
          else if (state is QRScanFail)
            {controller?.pauseCamera()}
        });
    super.initState();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.resumeCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => _qrScanningBloc,
        child: BlocBuilder<QRScanningBloc, QRScanningState>(
            builder: (BuildContext context, QRScanningState state) {
          return Scaffold(
              body: Container(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Expanded(flex: 4, child: _buildQrView(context)),
                Text('Scan QR code', style: TextStyle(color: Colors.white)),
                Positioned(
                    bottom: 128,
                    child: Container(
                      height: 72,
                      width: 72,
                      color: Colors.transparent,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(64.0),
                              )),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent)),
                          onPressed: () async {
                            await controller?.toggleFlash();
                            setState(() {});
                          },
                          child: FutureBuilder(
                            future: controller?.getFlashStatus(),
                            builder: (context, snapshot) {
                              if (snapshot.data != null &&
                                  snapshot.data == true) {
                                return Icon(Icons.flash_on, size: 38);
                              }
                              return Icon(Icons.flash_off, size: 38);
                            },
                          )),
                    )),
                if (state is QRScanFail) _alertScanFailDialog(context)
              ],
            ),
          ));
        }));
  }

  Widget _alertScanFailDialog(BuildContext context) {
    return AlertDialog(
      actionsPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      contentPadding: EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      content: Text("Mã QR không đúng định dạng. Vui lòng thử lại.",
          style: TextStyle(fontSize: 14.8, height: 1.32)),
      actions: [
        TextButton(
          child: Text("Thử lại",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 116, 57, 205))),
          onPressed: () {
            _qrScanningBloc.add(RefreshState());
            controller?.resumeCamera();
          },
        ),
      ],
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    double scanArea = 250.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Color.fromARGB(255, 136, 54, 244),
          borderRadius: 0,
          borderLength: 20,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      controller.pauseCamera();
      _qrScanningBloc.add(CheckQRCode(userState.user.id, scanData.code!));
      setState(() {
        result = scanData;
      });
    });
    controller.pauseCamera();
    controller.resumeCamera();
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
