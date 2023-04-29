import 'package:conveniencia/app/features/home/door/data/models/form_door.dart';
import 'package:conveniencia/app/features/home/door/presenter/controller/door_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

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

      if(barcodeScanRes != const String.fromEnvironment('URL_SITE')){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("OPS!!! QRcode inválido.")),
        );
        return;
      }else{
        barcodeScanRes = 'Carregando...';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(barcodeScanRes)),
        );
        final flutterSecureStorage = const FlutterSecureStorage();
        String? token = await flutterSecureStorage.read(key: 'jwt_token') ?? "";
        cubit.openDoor(FormDoorModel(token: token));
      }
      setState(() {
        _ticket = barcodeScanRes;
      });
    } on PlatformException {
      barcodeScanRes = 'Falha ao obter a versão da plataforma.';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(barcodeScanRes)),
      );
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
        if(state is DoorSuccessfull){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.map["message"])),
          );
          print("ok");
        }
        if(state is DoorError){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error.errorMessage)),
          );
          print("error");
        }
      },
      child: Scaffold(
        body:
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_isLoading)
                const CircularProgressIndicator()
              else
                ElevatedButton(
                  onPressed: _readQRCode,
                  child: Column(
                    children: const [
                      Icon(Icons.qr_code, size: 100),
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text("ABRIR PORTA"),
                      )
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}