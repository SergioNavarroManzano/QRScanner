import 'package:escaner_sql/Widgets/custom_navigatorbar.dart';
import 'package:escaner_sql/Widgets/scan_button.dart';
import 'package:escaner_sql/pages/direcciones_page.dart';
import 'package:escaner_sql/pages/mapas_page.dart';
import 'package:escaner_sql/providers/db_provider.dart';
import 'package:escaner_sql/providers/scan_list_provider.dart';
import 'package:escaner_sql/providers/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Historial'),
        actions: [
          IconButton(
            onPressed: (){
              Provider.of<ScanListProvider>(context,listen: false).borrrarTodos();



            }, 
            icon: Icon(Icons.delete_forever))
        ]
      ),
      body: _HomePageBody(),

      bottomNavigationBar: CustomNavigatorBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
   );
  }
}


class _HomePageBody extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    //obntener el current menu opt
    final uiProvider=Provider.of<UiProvider>(context);

    //cambiar para mostrar las paginas
    final currentIndex=uiProvider.selectedMenuOpt;

    //TODO: ller la base de datos
    // final temp=new ScanModel(valor: 'http://google.es');
    //  DBProvider.db.deleteAllScans().then(print);

    final scanListProvider=Provider.of<ScanListProvider>(context,listen: false);

    switch(currentIndex){

      case 0:
        scanListProvider.cargarScansTipo('geo');
        return MapasPage();
      case 1:
        scanListProvider.cargarScansTipo('http');
        return DireccionesPage();


      default: return MapasPage();
    }
    
  }
}