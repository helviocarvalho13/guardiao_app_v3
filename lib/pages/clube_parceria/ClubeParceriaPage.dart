import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:guardiao_app_v3/data/usuario/usuario_data.dart';
import 'package:guardiao_app_v3/pages/clube_parceria/HomeGuardiao.dart';
import 'package:guardiao_app_v3/pages/clube_parceria/Menu.dart';
import 'package:guardiao_app_v3/pages/clube_parceria/Header.dart';

class ClubeParceriaPage extends StatefulWidget {
  @override
  _ClubeParceriaPageState createState() => _ClubeParceriaPageState();
}

class _ClubeParceriaPageState extends State<ClubeParceriaPage>{
  final _scaffoldKey                = new GlobalKey<ScaffoldState>();
  bool _isLoading;
  Usuario _usuario;

  _ClubeParceriaPageState(){}

  Future<String> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String autorizacao = prefs.getString('token');
    return autorizacao;
  }

  @override
  void initState(){
    super.initState();
    _isLoading = true;
  }

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
