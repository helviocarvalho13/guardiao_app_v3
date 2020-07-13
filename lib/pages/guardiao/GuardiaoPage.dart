import 'package:flutter/material.dart';
import 'package:guardiao_app_v3/data/parceria/parceria_data.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'dart:async';

import 'package:guardiao_app_v3/data/sistema/sistema_data.dart';
import 'package:guardiao_app_v3/data/usuario/usuario_data.dart';

import 'package:guardiao_app_v3/modules/sistema/sistema_presenter.dart';
import 'package:guardiao_app_v3/modules/usuario/usuario_presenter.dart';
import 'package:guardiao_app_v3/modules/parceria/parceria_presenter.dart';

import 'package:guardiao_app_v3/pages/guardiao/Menu.dart';
import 'package:guardiao_app_v3/pages/guardiao/Header.dart';

import 'package:guardiao_app_v3/pages/clube_parceria/ClubeParceriaDTO.dart';

import 'package:guardiao_app_v3/util/Utils.dart';

class GuardiaoPage extends StatefulWidget {
  @override
  _GuardiaoPageState createState() => _GuardiaoPageState();
}

class _GuardiaoPageState extends State<GuardiaoPage> implements UsuarioViewContract, SistemaViewContract{
  UsuarioPresenter _usuarioPresenter;
  SistemaPresenter _sistemaPresenter;

  final _scaffoldKey                = new GlobalKey<ScaffoldState>();
  bool _isLoadingUsuario;
  bool _isLoadingSistemas;

  List<Sistema> _sistemas;
  Usuario _usuario;

  _GuardiaoPageState(){
    _usuarioPresenter = new UsuarioPresenter(this);
    _sistemaPresenter = new SistemaPresenter(this);
  }

  @override
  void initState(){
    super.initState();
    _isLoadingUsuario = true;
    _isLoadingSistemas = true;
    _usuarioPresenter.retornaUsuario();
    _sistemaPresenter.retornaSistemas();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: Header(context),
      drawer: _isLoadingUsuario ? new Center(
        child: new CircularProgressIndicator(),
      ) : Menu(context, _usuario),
      body: _isLoadingSistemas ? new Center(
        child: new CircularProgressIndicator(),
      ) : new ListView.builder(
          itemCount: _sistemas.length,
          itemBuilder: (BuildContext context, int index){

            final sistemaThumbnail = new Container(
              margin: new EdgeInsets.symmetric(vertical: 8.0),
              alignment: FractionalOffset.centerLeft,
              child: _sistemas[index].id == '00001' || _sistemas[index].iconeUrl == '' ? Image.asset("assets/imgs/logo_tre_01.png", height: 92.0,width: 92.0) : Image.network(_sistemas[index].iconeUrl, height: 92.0,width: 92.0)//new Image.asset(_sistemas[index].iconeUrl, height: 92.0,width: 92.0)
            );

            final baseTextStyle = const TextStyle(
                fontFamily: 'Poppins'
            );

            final headerTextStyle = baseTextStyle.copyWith(
                color: Colors.white,
                fontSize: 12.0,
                fontWeight: FontWeight.w400
            );

            final regularTextStyle = baseTextStyle.copyWith(
                color: Colors.white,
                fontSize: 9.0,
                fontWeight: FontWeight.w400
            );

            final subHeaderTextStyle = regularTextStyle.copyWith(
                fontSize: 9.0
            );

            Widget _sistemaValue({String value, String image}) {
              return new Row(
                  children: <Widget>[
                    //new Image.asset(image, height: 12.0),
                    new Container(width: 0.0),
                    new Text(value, style: regularTextStyle),
                  ]
              );
            }

            final sistemaCardContent = new Container(

              margin: new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
              constraints: new BoxConstraints.expand(),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(height: 4.0),
                  new Text(_sistemas[index].sigla,
                    style: headerTextStyle,
                  ),
                  new Container(height: 10.0),
                  new Text(_sistemas[index].nome,
                      style: subHeaderTextStyle
                  ),
                ],
              ),
            );

            final sistemaCard = new Container(
              child: sistemaCardContent,
              height: 95.0,
              margin: new EdgeInsets.only(left: 46.0),
              decoration: new BoxDecoration(
                color: Utils.hexToColor(_sistemas[index].cor),//new Color(0xFF333366),
                shape: BoxShape.rectangle,
                borderRadius: new BorderRadius.circular(8.0),
                boxShadow: <BoxShadow>[
                  new BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.0,
                    offset: new Offset(10.0, 15.0),
                  ),
                ],
              ),
            );

            return new GestureDetector(
              //onLongPress: () => _heroShow(context),
              onTap: ()  {
                if(_sistemas[index].id == '00001' && (_usuario.frenteIdentidadeFuncionalUrl == null || _usuario.versoIdentidadeFuncionalUrl == null)){
                  FocusScope.of(_scaffoldKey.currentContext).requestFocus(new FocusNode());
                  _scaffoldKey.currentState?.removeCurrentSnackBar();
                  _scaffoldKey.currentState.showSnackBar(new SnackBar(
                    content: new Text(
                      "Usuário não possui carteira funcional.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: "WorkSansSemiBold"),
                    ),
                    backgroundColor: Utils.corPadraoError(),
                    duration: Duration(seconds: 2),
                  ));
                }else {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (ctx) =>
                          new Scaffold(
                            appBar: Header(context),
                            body: new Center(
                              child: new CircularProgressIndicator(),
                            ),
                          )
                      )
                  );
                  goToSystem(_sistemas[index]);
                }
              },
              child: new Container(
                height: 95.0,
                  margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                child: new Stack(
                  children: <Widget>[
                    sistemaCard,
                    sistemaThumbnail,
                  ],
                )
              ),
            );
          }
      )
    );
  }

  void goToSystem(Sistema s) async{
      if(s.id == '93'){
      //if(s.id == '75'){
        Navigator.of(_scaffoldKey.currentContext).pushNamedAndRemoveUntil('/clubeParceriaPage/parcerias',
            ModalRoute.withName('/guardiaoPage'), arguments: _usuario);
      }
      if(s.id == '00001'){
        Navigator.of(_scaffoldKey.currentContext).pushNamedAndRemoveUntil('/carteiraFuncionalFrontPage',
            ModalRoute.withName('/guardiaoPage'), arguments: _usuario);
      }

      if(s.id == '47'){
      //if(s.id == '44'){
        Navigator.of(_scaffoldKey.currentContext).pushNamedAndRemoveUntil('/portalServidorPage',
            ModalRoute.withName('/guardiaoPage'), arguments: _usuario);
      }

  }

  @override
  void retornaSistemas(List<Sistema> sistemas) {
    setState(() {
      _sistemas = sistemas;
      _isLoadingSistemas = false;
    });
  }

  @override
  void retornaUsuario(Usuario usuario) {
    setState(() {
      _usuario = usuario;
      _isLoadingUsuario = false;
    });
  }

  @override
  void retornaSistemaError(String msg) {
    msg = "Erro ao retornar os sistemas";
    FocusScope.of(_scaffoldKey.currentContext).requestFocus(new FocusNode());
    _scaffoldKey.currentState?.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
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
    ));

    Future.delayed(Duration(seconds: 1)).then((_){
      Navigator.of(context).pushNamedAndRemoveUntil('/loginPage',
              (Route<dynamic> route) => false);
    });
  }

  @override
  void retornaUsuarioError(String msg) {
    msg = "Erro ao retornar o Usuário logado!";
    FocusScope.of(_scaffoldKey.currentContext).requestFocus(new FocusNode());
    _scaffoldKey.currentState?.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
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
    ));

    Future.delayed(Duration(seconds: 1)).then((_){
      Navigator.of(context).pushNamedAndRemoveUntil('/loginPage',
              (Route<dynamic> route) => false);
    });
  }
}
