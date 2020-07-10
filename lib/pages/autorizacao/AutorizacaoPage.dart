import 'package:flutter/material.dart';
import 'package:guardiao_app_v3/pages/login/LoginPage.dart';
import 'package:guardiao_app_v3/modules/autorizacao/autorizacao_presenter.dart';
import 'package:guardiao_app_v3/pages/autorizacao/FormAutorizacao.dart';
import 'package:guardiao_app_v3/util/Utils.dart';

class AutorizacaoPage extends StatefulWidget {
  @override
  _AutorizacaoPageState createState() => _AutorizacaoPageState();
}

class _AutorizacaoPageState extends State<AutorizacaoPage> implements  AutorizacaoViewContract{
  AutorizacaoPresenter  _presenter;
  final _scaffoldKey                = new GlobalKey<ScaffoldState>();
  final FormAutorizacao formulario  = new FormAutorizacao();

  _AutorizacaoPageState(){
    _presenter = new AutorizacaoPresenter(this);
  }

  @override
  void initState(){
    super.initState();
  }

  void submit() {
    if(_getValidations()) {
      _presenter.retornaAutorizacao(this.formulario.tituloEleitor.value.text, this.formulario.codigo.value.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        backgroundColor: Utils.corPadraoGuardiao(),
        centerTitle: true,
        title: new Text('Autorização')
      ),
      body: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Form(
            child: new ListView(
              children: <Widget>[
                new TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    icon: new Icon(Icons.person),
                    hintText: 'Digite seu título de eleitor',
                    labelText: 'Título de Eleitor'
                  ),
                  controller: this.formulario.tituloEleitor,
                ),
                new TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                      icon: new Icon(Icons.lock),
                      hintText: 'Digite seu código de autorização',
                      labelText: 'Código de Autorização'
                  ),
                  controller: this.formulario.codigo,
                ),
                new Container(
                  //width: screenSize.width,
                  child: new RaisedButton(
                    child: new Text(
                      'Autorizar',
                      style: new TextStyle(
                          color: Colors.white
                      ),
                    ),
                    onPressed: this.submit,
                    color: Utils.corPadraoGuardiao(),
                  ),
                  margin: new EdgeInsets.only(
                      top: 20.0
                  ),
                )
              ],
            )
        ),
      ),
    );
  }

  @override
  void autorizar(int autorizacao) {
    if(autorizacao == 1){
      Navigator.of(_scaffoldKey.currentContext).pushNamedAndRemoveUntil('/loginPage', (Route<dynamic> route) => false);
    }
  }

  @override
  void autorizarError(String msg) {
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
        duration: Duration(seconds: 6),
      ));
  }

  bool _getValidations(){
    bool valido = true;
    if(formulario.tituloEleitor.value.text.isEmpty){
      valido = false;
      autorizarError('O campo *Título de Eleitor* é obrigatório!');
    }
    if(formulario.tituloEleitor.value.text.length != 12){
      valido = false;
      autorizarError('O campo *Título de Eleitor* é inválido!');
    }
    if(formulario.codigo.value.text.isEmpty){
      valido = false;
      autorizarError('O campo *Código de Autenticação* é obrigatório!');
    }
    return valido;
  }
}
