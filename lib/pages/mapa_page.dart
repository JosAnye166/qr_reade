import 'package:flutter/material.dart';
import 'package:qr_reade/modes/scan_model.dart';
import 'package:qr_reade/providers/db_provider.dart';


class MapaPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    
    final ScanModel scan = ModalRoute.of( context )?.settings.arguments as ScanModel;

    return Scaffold(
      appBar:  AppBar(
        title: Text('Mapa')
        ),

      body: Center(
        child: Text(scan.valor),
      
      
      ),
    );
  }
}