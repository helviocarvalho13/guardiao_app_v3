import 'package:flutter/material.dart';
import 'package:guardiao_app_v3/pages/guardiao/GuardiaoPage.dart';
import 'package:guardiao_app_v3/modules/login/login_presenter.dart';
import 'package:guardiao_app_v3/pages/login/FormLogin.dart';
import 'package:guardiao_app_v3/util/Utils.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginViewContract{
  LoginPresenter  _presenter;
  final _scaffoldKey          = new GlobalKey<ScaffoldState>();
  final FormLogin formulario  = new FormLogin();

  _LoginPageState(){
    _presenter = new LoginPresenter(this);
  }

  @override
  void initState(){
    super.initState();
  }

  void submit() {
    if (_getValidations()) {
      _presenter.retornaLogin(this.formulario.username.value.text, this.formulario.password.value.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
          backgroundColor: Utils.corPadraoGuardiao(),
          centerTitle: true,
          title: new Text('Login')
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
                  controller: this.formulario.username,
                ),
                new TextFormField(
                  obscureText: true,
                  decoration: new InputDecoration(
                      icon: new Icon(Icons.person),
                      hintText: 'Digite sua senha',
                      labelText: 'Senha'
                  ),
                  validator: (value){

                  },
                  controller: this.formulario.password,
                ),
                new Container(
                  //width: screenSize.width,
                  child: new RaisedButton(
                    child: new Text(
                      'Login',
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
  void login(int login) {
    if(login == 1){
      Navigator.of(_scaffoldKey.currentContext).pushNamedAndRemoveUntil('/guardiaoPage',
              (Route<dynamic> route) => false);
    }
  }

  @override
  void loginError(String msg) {
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
      duration: Duration(seconds: 12),
    ));
  }

  bool _getValidations(){
    bool valido = true;
    if(formulario.username.value.text.isEmpty){
      valido = false;
      loginError('O campo *Título de Eleitor* é obrigatório!');
    }
    if(formulario.username.value.text.length != 12){
      valido = false;
      loginError('O campo *Título de Eleitor* é inválido!');
    }
    if(formulario.password.value.text.isEmpty){
      valido = false;
      loginError('O campo *Senha* é obrigatório!');
    }
    return valido;
  }
}
