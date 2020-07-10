import 'package:flutter/material.dart';
import 'package:guardiao_app_v3/data/usuario/usuario_data.dart';
import 'package:guardiao_app_v3/util/Utils.dart';
import 'package:guardiao_app_v3/modules/usuario/usuario_presenter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:math' as math;

class CarteiraFuncionalFrontPage extends StatefulWidget {
  @override
  _CarteiraFuncionalFrontPageState createState() => _CarteiraFuncionalFrontPageState();
}

class _CarteiraFuncionalFrontPageState extends State<CarteiraFuncionalFrontPage>{
  final _scaffoldKey                = new GlobalKey<ScaffoldState>();
  bool _isLoading;
  Usuario _usuario;

  _CarteiraFuncionalFrontPageState(){}

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

    final baseTextStyle = const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 10,
        fontWeight: FontWeight.w800
    );

    Widget retornaIdentidadeError(String msg) {
      return new SnackBar(
        content: new Text(
          msg,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontFamily: "WorkSansSemiBold"),
        ),
        backgroundColor: Utils.corPadraoError(),
        duration: Duration(seconds: 2),
      );
    }

    _usuario = ModalRoute.of(context).settings.arguments;
    return new Scaffold(
        key: _scaffoldKey,
        appBar: new AppBar(
          backgroundColor: Utils.corPadraoIdentidadeFuncional(),
          centerTitle: true,
          title: new Text("Identidade Funcional"),
          leading: new IconButton(
            icon: new Icon(Icons.close),
            onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/guardiaoPage')),
          ),
        ),
        body: new GestureDetector(
          child: new Column(
            children: <Widget>[
              new Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: new Text('Toque duas vezes para ver o verso',
                  style: new TextStyle(fontSize: 20, fontWeight: FontWeight.w600 )),
              ),
              new Container(
                padding: new EdgeInsets.fromLTRB(0, 0, 0, 0),
                //color: Utils.corPadraoError(),
                child: new RotatedBox(
                  quarterTurns: 1,
                  child: new Stack(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 40),
                        child: new CachedNetworkImage(
                          placeholder: (context, url) => new CircularProgressIndicator(),
                          imageUrl: _usuario.frenteIdentidadeFuncionalUrl,
                          errorWidget: (context, url, error) => Image.asset("assets/imgs/FRENTE_INDISPONIVEL.png"),
                        )
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          onDoubleTap: () => Navigator.of(_scaffoldKey.currentContext).pushNamedAndRemoveUntil('/carteiraFuncionalBackPage',
              ModalRoute.withName('/guardiaoPage'), arguments: _usuario),
          //onDoubleTap: () => Navigator.of(context).pushNamed('/carteiraFuncionalBackPage', arguments: _usuario),
        ),
    );
  }
}
