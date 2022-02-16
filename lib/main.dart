import 'package:escaner_sql/pages/home_page.dart';
import 'package:escaner_sql/pages/mapa_page.dart';
import 'package:escaner_sql/providers/scan_list_provider.dart';
import 'package:escaner_sql/providers/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (_)=> new UiProvider()),
        ChangeNotifierProvider(create: (_)=> new ScanListProvider()),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {
          'home':(_)=>HomeScreen(),
          'mapa':(_)=>MapScreen(),
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.deepPurple
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: Colors.deepPurple
          )
        ),
      ),
    );
  }
}