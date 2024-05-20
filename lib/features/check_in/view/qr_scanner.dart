import 'dart:io';
import 'package:flutter/material.dart';
import 'package:inlaks_attendance_app/core/widgets/loading_widget.dart';
import 'package:inlaks_attendance_app/features/check_in/data/repository/repository.dart';
import 'package:inlaks_attendance_app/features/check_in/view/check_in.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanner extends StatefulWidget {
  static const id = '/qr_scanner';
  const QrScanner({super.key});

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  String errorMessage = '';

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
    try {
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
        if (!mounted) return;
        toggleIsLoading(context, false);

        showDialog(
          context: context,
          builder: (builder) => AlertDialog(
            title: const Text('Invalid Qr Code'),
            content: const Text('The QR code you scanned is invalid.'),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    result = null;
                  });
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    result = null;
                  });
                  Navigator.of(context).pop();
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        );
        setState(() {});
        return;
      }
    } catch (e) {
      toggleIsLoading(context, false);
      setState(() {
        result = null;
      });
    }
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
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
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          height: cs.height * 0.5,
          child: QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Colors.green,
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: scanArea,
            ),
          ),
        ),
      ),
    );
  }
}
