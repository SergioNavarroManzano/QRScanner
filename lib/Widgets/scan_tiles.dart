import 'package:escaner_sql/providers/scan_list_provider.dart';
import 'package:escaner_sql/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScanTiles extends StatelessWidget {

  final String tipo;

  const ScanTiles({@required this.tipo});
  

  @override
  Widget build(BuildContext context) {
    final scanListProvoder=Provider.of<ScanListProvider>(context);
    final scans=scanListProvoder.scans;
    return ListView.builder(
      itemCount: scanListProvoder.scans.length,
      itemBuilder:(_,i)=>Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (DismissDirection direccion){
          Provider.of<ScanListProvider>(context,listen: false).borrarScanPorId(scans[i].id);
        },
        child: ListTile(
          leading: Icon(
            this.tipo=='http'
            ? Icons.home
            : Icons.map,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(scans[i].valor),
          subtitle: Text(scans[i].id.toString()),
          trailing: Icon(Icons.keyboard_arrow_right,color:Colors.grey),
          onTap: ()=>launchURL(context, scans[i]),//Para lanzar hay que dar permisos en el amnifest en android
        ),
      ) 
    );
  }
}