import 'package:flutter/material.dart';
import 'package:qr_reade/widgets/scan_tiles.dart';

class DirrecionesPage  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

   return ScanTiles(tipo: 'http');
  
   
  }
}