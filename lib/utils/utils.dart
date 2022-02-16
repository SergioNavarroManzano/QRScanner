import 'package:escaner_sql/models/scan_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(BuildContext context ,ScanModel scan) async{

  final url=scan.valor;

  if (scan.tipo=='http'){
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw 'Could not launch $url';//Hya que dar permisos en el manifest de android
    }
  }else{
    Navigator.pushNamed(context, 'mapa',arguments: scan);
  }

}