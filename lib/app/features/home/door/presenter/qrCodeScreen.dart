import 'package:conveniencia/app/features/home/door/data/models/form_door.dart';
import 'package:conveniencia/app/features/home/door/presenter/controller/door_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';


import '../../../signup/presenter/controller/signup_cubit.dart';
import 'controller/door_state.dart';

class QRCodeScreen extends StatefulWidget {
  const QRCodeScreen({Key? key}) : super(key: key);

  @override
  _QRCodeScreenState createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {
  bool _isLoading = false;
  String _ticket = '';
  final cubit = GetIt.I.get<DoorCubit>();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _readQRCode() async {
    String barcodeScanRes;
    try {
      setState(() {
        _isLoading = true;
      });
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancelar', true, ScanMode.QR);

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
    return BlocListener<DoorCubit, DoorState>(
      bloc: cubit,
      listener: (context, state) {
        // Aqui você pode atualizar a interface do usuário com base no estado atual do DoorCubit
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Leitor de QR Code'),
        ),
        body:
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_isLoading)
                const CircularProgressIndicator()
              else
                if (_ticket.isNotEmpty)
                  Text('$_ticket')
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
      ),
    );
  }
}