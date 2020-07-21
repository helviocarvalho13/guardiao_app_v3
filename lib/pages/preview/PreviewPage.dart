import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:guardiao_app_v3/pages/login/LoginPage.dart';
import 'package:guardiao_app_v3/pages/autorizacao/AutorizacaoPage.dart';
import 'package:guardiao_app_v3/util/Utils.dart';


class PreviewPage extends StatefulWidget {
  @override
  _PreviewPageState createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  @override
  Widget build(BuildContext context) {

    _getAuthorization() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String autorizacao = prefs.getString('autorizacao');
      return autorizacao;
    }

    return new Scaffold(
      backgroundColor: Utils.corPadraoGuardiao(),
      body: new Container(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Padding(
              padding: new EdgeInsets.fromLTRB(0.0, 0.0, 30.0, 0.0),
              child: new Image.asset('assets/imgs/logo_tre_01.png'),
            ),
            new Padding(
              padding: new EdgeInsets.all(20.0),
              child: new Text(
                'Bem-vindo ao Guardião, aplicativo oficial e portal de acesso aos sistemas do TRE/MA!',
                style: new TextStyle(
                  color: Colors.white,
                  fontFamily: 'FlamanteRomaItalic',
                  fontSize: 18.0,
                ),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.all(20.0),
              child: new RaisedButton(
                  child: new Text('Ir para o Guardião'),
                  onPressed: () async {
                    //String autorizacao = '1';
                    String autorizacao = await _getAuthorization();
                    if(autorizacao == '1'){
                      Navigator.of(context).pushNamed('/loginPage');
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => new LoginPage()));
                    }else{
                      Navigator.of(context).pushNamed('/autorizacaoPage');
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => new AutorizacaoPage()));
                    }
                  }
              )
            ),
          ],
        ),
      ),
    );
  }
}
