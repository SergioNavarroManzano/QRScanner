import 'package:escaner_sql/Widgets/scan_tiles.dart';
import 'package:escaner_sql/providers/scan_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class DireccionesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScanTiles(tipo: 'http');
  }
}