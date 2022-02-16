import 'package:escaner_sql/models/scan_model.dart';
import 'package:flutter/material.dart';


class MapScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final ScanModel scan=ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
      ),
      body: Center(
        child: Text(scan.valor),
     ),
   );
  }
}