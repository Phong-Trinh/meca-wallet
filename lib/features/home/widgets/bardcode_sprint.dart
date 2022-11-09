import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

class BardcodeSprint extends StatelessWidget {
  final String cusId;

  const BardcodeSprint({super.key, required this.cusId});

  @override
  Widget build(BuildContext context) {
    return BarcodeWidget(
      // Barcode type and settings
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          border: Border.all(color: const Color.fromARGB(255, 232, 223, 202))),
      data: cusId, // Content
      padding: const EdgeInsets.fromLTRB(22, 30, 22, 2.4),
      textPadding: 8,
      barcode: Barcode.code128(),
      height: 196,
      width: double.infinity,
    );
  }
}
