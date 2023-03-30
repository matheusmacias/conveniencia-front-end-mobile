import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QRCodeScreen extends StatefulWidget {
  const QRCodeScreen({Key? key}) : super(key: key);

  @override
  _QRCodeScreenState createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {
  bool _isLoading = false;
  String _ticket = '';

  Future<void> _readQRCode() async {
    String barcodeScanRes;
    try {
      setState(() {
        _isLoading = true;
      });
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancelar', true, ScanMode.QR);
      if (barcodeScanRes == '-1') {
        barcodeScanRes = 'Nenhum';
      }
      setState(() {
        _ticket = barcodeScanRes;
      });
    } on PlatformException {
      barcodeScanRes = 'Falha ao obter a versão da plataforma.';
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leitor de QR Code'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isLoading)
              const CircularProgressIndicator()
            else if (_ticket.isNotEmpty)
              Text('Ticket: $_ticket')
            else
              const Text('Pressione o botão para ler o QR Code'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _readQRCode,
              child: const Text('ABRIR A PORTA'),
            ),
          ],
        ),
      ),
    );
  }
}