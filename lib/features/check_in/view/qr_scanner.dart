import 'dart:io';
import 'package:flutter/material.dart';
import 'package:inlaks_attendance_app/core/widgets/loading_widget.dart';
import 'package:inlaks_attendance_app/features/check_in/data/repository/repository.dart';
import 'package:inlaks_attendance_app/features/check_in/view/check_in.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({super.key});

  static const id = '/qr_scanner';

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  String errorMessage = '';

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (result != null) return;
      setState(() {
        result = scanData;
        if (result != null) {
          checkQrValidaity(qrCode: result!.code!);
        }
      });
    });
  }

  checkQrValidaity({required String qrCode}) async {
    toggleIsLoading(context, true);
    final data = await QrRepository.checkQrValidaity(qrCode: qrCode);
    if (data == 200) {
      errorMessage = '';
      if (!mounted) return;
      toggleIsLoading(context, false);
      Navigator.pushReplacementNamed(
        context,
        CheckInScreen.id,
        arguments: qrCode,
      );
      return;
    } else {
      errorMessage = 'Invalid Qr Code';
      result = null;
      if (!mounted) return;
      toggleIsLoading(context, false);
      setState(() {});
      return;
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            height: cs.height * 0.5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Center(
              child: Text(
            errorMessage,
            style: const TextStyle(
              color: Colors.white,
            ),
          ))
        ],
      ),
    );
  }
}
