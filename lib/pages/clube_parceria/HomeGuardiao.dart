import 'package:flutter/material.dart';
import 'package:guardiao_app_v3/util/Utils.dart';

FloatingActionButton HomeGuardiao(BuildContext context){
  return new FloatingActionButton(
    onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil('/guardiaoPage',
            (Route<dynamic> route) => false),
    child: new Icon(Icons.home),//new Image(image: new AssetImage('assets/icons/guardiao-logo.png'), width: 40, height: 40,),
    backgroundColor: Utils.corPadraoGuardiao(),
  );
}


