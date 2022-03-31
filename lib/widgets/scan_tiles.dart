import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reade/providers/scan_list_provider.dart';
import 'package:qr_reade/utils/utils.dart';

class ScanTiles extends StatelessWidget {

  final String tipo;

  const ScanTiles ({ required this.tipo });

  @override
  Widget build(BuildContext context) {
    
    final scanListProvider =  Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

   
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, i) =>Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (DismissDirection direction){
        Provider.of<ScanListProvider>(context, listen: false).
        borrarScanPorId(int.parse(scans[i]!.id.toString()));

        },
        child: ListTile(
          leading: Icon(
          this.tipo == 'http'
          ? Icons.home_outlined
          : Icons.map_outlined,
             color: Theme.of(context).primaryColor
             ),
          title: Text(scans[i]!.valor ),
          subtitle: Text(scans[i]!.id.toString()),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
          onTap: () => launchURL(context, scans[i]!),
          ),
        )
    

    );
  }
}