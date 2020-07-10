import 'package:flutter/material.dart';
import 'package:guardiao_app_v3/util/Utils.dart';

AppBar Header(BuildContext context){
  return new AppBar(
    backgroundColor: Utils.corPadraoGuardiao(),
    centerTitle: true,
    title: new Text('Guardião - TRE/MA'),
    actions: <Widget>[
      new IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil('/loginPage', (Route<dynamic> route) => false)
      )
    ],
  );
}