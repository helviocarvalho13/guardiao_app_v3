import 'package:guardiao_app_v3/data/usuario/usuario_data.dart';
import 'package:guardiao_app_v3/pages/portal_servidor/Header.dart';
import 'package:guardiao_app_v3/pages/portal_servidor/Menu.dart';
import 'package:guardiao_app_v3/pages/portal_servidor/HomeGuardiao.dart';
import 'package:flutter/material.dart';

class PortalServidorPage extends StatefulWidget {
  @override
  _PortalServidorPageState createState() => _PortalServidorPageState();
}

class _PortalServidorPageState extends State<PortalServidorPage> {
  final _scaffoldKey                = new GlobalKey<ScaffoldState>();
  Usuario _usuario;

  @override
  Widget build(BuildContext context) {
    _usuario = ModalRoute.of(context).settings.arguments;
    return new Scaffold(
        key: _scaffoldKey,
        appBar: Header(context),
        drawer: Menu(context, _usuario),
        body: new Container(
          child: new Padding(
            padding: EdgeInsets.all(55.0),
            child: new Image.asset('assets/imgs/BRASAO_TRE_MA.png'),
          ),
        ),
        floatingActionButton: HomeGuardiao(context)
    );
  }
}
