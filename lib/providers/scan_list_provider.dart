import 'package:escaner_sql/providers/db_provider.dart';
import 'package:flutter/cupertino.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans=[];
  String tipoSeleccionado = 'http';

  Future <ScanModel>nuevoScan(String valor) async{
    final nuevoScan=new ScanModel(valor: valor);
    final id=await DBProvider.db.nuevoScan(nuevoScan);
    //asignar el id de la base de datos
    nuevoScan.id=id;
    if(this.tipoSeleccionado==nuevoScan.tipo){
      this.scans.add(nuevoScan);
      notifyListeners();
    }
    return nuevoScan;
    
  }

  cargarScans() async{
    final scans= await DBProvider.db.getScanTodos();
    this.scans=[...scans];
    notifyListeners();
  }

  cargarScansTipo(String tipo) async{
    final scans= await DBProvider.db.getScanByType(tipo);
    this.scans=[...scans];
    this.tipoSeleccionado=tipo;
    notifyListeners();
  }

  borrrarTodos() async{
    await DBProvider.db.deleteAllScans();
    this.scans=[];
    notifyListeners();
  }


  borrarScanPorId(int id) async{
    await DBProvider.db.deleteScan(id);
    cargarScansTipo(this.tipoSeleccionado);
    //no se pone notify porque ya lo hace
  }
  
}