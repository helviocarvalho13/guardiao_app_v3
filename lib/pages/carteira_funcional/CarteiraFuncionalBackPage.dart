import 'package:flutter/material.dart';
import 'package:guardiao_app_v3/util/Utils.dart';
import 'package:guardiao_app_v3/modules/usuario/usuario_presenter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:guardiao_app_v3/data/usuario/usuario_data.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CarteiraFuncionalBackPage extends StatefulWidget {
  @override
  _CarteiraFuncionalBackPageState createState() => _CarteiraFuncionalBackPageState();
}

class _CarteiraFuncionalBackPageState extends State<CarteiraFuncionalBackPage>{

  final _scaffoldKey                = new GlobalKey<ScaffoldState>();
  bool _isLoading;
  Usuario _usuario;

  _CarteiraFuncionalBackPageState(){}

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
              child: new Text('Toque duas vezes para ver a frente',
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
                          imageUrl: _usuario.versoIdentidadeFuncionalUrl,
                          errorWidget: (context, url, error) => Image.asset("assets/imgs/FRENTE_INDISPONIVEL.png"),
                        )
                    ),
                    /*new Image(
                      image: new AssetImage('assets/imgs/CARTEIRA_FUNCIONAL_VERSO.jpg'),
                    ),
                    new Padding(
                      padding: EdgeInsets.fromLTRB(30, 180, 0, 0),
                      child: //new Image.network(_usuario.impressaoDigitalUrl, width: 136, height: 156,)
                      new CachedNetworkImage(
                        placeholder: (context, url) => new CircularProgressIndicator(),
                        imageUrl: _usuario.impressaoDigitalUrl,
                        height: 156.0,
                        width: 136.0,
                      ),
                      *//*new Image(
                        image: new AssetImage('assets/icons/digital-logo.png'),
                        width: 116,
                        height: 136,
                      ),*//*
                    ),
                    new Padding(
                      padding: EdgeInsets.fromLTRB(40, 63, 0, 0),
                      child: Text(_usuario.cpf, style: baseTextStyle),
                    ),
                    new Padding(
                      padding: EdgeInsets.fromLTRB(195, 63, 0, 0),
                      child: Text(_usuario.tituloEleitor, style: baseTextStyle),
                    ),
                    new Padding(
                      padding: EdgeInsets.fromLTRB(40, 98, 0, 0),
                      child: Text(_usuario.rg + ' / ' + _usuario.orgaoEmissoRG + ' / ' + _usuario.dataEmissaoRG,
                          style: baseTextStyle),
                    ),
                    new Padding(
                      padding: EdgeInsets.fromLTRB(300, 98, 0, 0),
                      child: Text(_usuario.pisPasep,
                          style: baseTextStyle),
                    ),
                    new Padding(
                      padding: EdgeInsets.fromLTRB(40, 135, 0, 0),
                      child: Text(_usuario.nomeMae, style: baseTextStyle),
                    ),
                    new Padding(
                      padding: EdgeInsets.fromLTRB(40, 155, 0, 0),
                      child: Text(_usuario.nomePai, style: baseTextStyle),
                    ),
                    new Padding(
                      padding: EdgeInsets.fromLTRB(148, 195, 0, 0),
                      child: Text(_usuario.naturalidade, style: baseTextStyle),
                    ),
                    new Padding(
                      padding: EdgeInsets.fromLTRB(148, 230, 0, 0),
                      child: Text(_usuario.naturalidade, style: baseTextStyle),
                    ),
                    new Padding(
                      padding: EdgeInsets.fromLTRB(248, 230, 0, 0),
                      child: Text('teste'*//*_usuario.dataEmissaoCarteiraFuncional*//*, style: baseTextStyle),
                    ),
                    new Padding(
                      padding: EdgeInsets.fromLTRB(368, 230, 0, 0),
                      child: Text(_usuario.sangueRH, style: baseTextStyle),
                    )*/
                  ],
                ),
              ),
            )
          ],
        ),
        onDoubleTap: () => Navigator.of(_scaffoldKey.currentContext).pushNamedAndRemoveUntil('/carteiraFuncionalFrontPage',
            ModalRoute.withName('/guardiaoPage'), arguments: _usuario),
      ),
    );
  }
}
