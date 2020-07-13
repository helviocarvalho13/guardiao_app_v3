import 'package:flutter/material.dart';
import 'package:guardiao_app_v3/data/usuario/usuario_data.dart';
import 'package:guardiao_app_v3/data/servidor/ferias_data.dart';
import 'package:guardiao_app_v3/modules/servidor/ferias_presenter.dart';
import 'package:guardiao_app_v3/pages/portal_servidor/Header.dart';
import 'package:guardiao_app_v3/pages/portal_servidor/Menu.dart';
import 'package:guardiao_app_v3/util/Utils.dart';


class FeriasPage extends StatefulWidget {
  @override
  _FeriasPageState createState() => _FeriasPageState();
}

class _FeriasPageState extends State<FeriasPage> implements FeriasViewContract{
  FeriasPresenter _feriasPresenter;

  final _scaffoldKey                = new GlobalKey<ScaffoldState>();
  List<Ferias> _ferias;
  bool _isLoadingFerias;
  Usuario _usuario;

  _FeriasPageState(){
    _feriasPresenter = new FeriasPresenter(this);
  }

  @override
  void initState(){
    super.initState();
    _isLoadingFerias = true;
    _feriasPresenter.retornaFerias();
  }

  @override
  Widget build(BuildContext context) {
    _usuario = ModalRoute.of(context).settings.arguments;
    return new Scaffold(
        key: _scaffoldKey,
        appBar: Header(context),
        drawer: Menu(context, _usuario),
        body: _isLoadingFerias ? new Center(
          child: new CircularProgressIndicator(),
        ) : new ListView.builder(
            itemCount: _ferias.length,
            itemBuilder: (BuildContext context, int index){

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
                  fontSize: 12.0
              );

              final sistemaCardContent = new Container(
                margin: new EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 8.0),
                constraints: new BoxConstraints.expand(),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //new Container(height: 2.0),
                    new Row(
                      children: <Widget>[
                        new Text("ANO: ",
                          style: headerTextStyle,
                        ),
                        new Text(_ferias[index].periodo,
                          style: headerTextStyle,
                        ),
                        new Container(width: 5.0),
                        new Text("Período Aquisição: " + _ferias[index].dataInicioAquisicao + " à " + _ferias[index].dataFimAquisicao,
                            style: headerTextStyle
                        ),
                      ],
                    ),
                    new Container(height: 10.0),
                    new Row(
                      children: <Widget>[
                        new Text("Primeira Parcela: " + _ferias[index].dataInicioPrimeiraParcela + " à " + _ferias[index].dataFimPrimeiraParcela,
                            style: subHeaderTextStyle
                        ),
                        new Container(width: 5.0),
                        new Text("Situação: " + _ferias[index].situacaoPrimeiraParcela,
                            style: subHeaderTextStyle
                        ),
                      ],
                    ),
                    new Container(height: 2.0),
                    new Row(
                      children: <Widget>[
                        new Text("Segunda Parcela: " + _ferias[index].dataInicioSegundaParcela + " à " + _ferias[index].dataFimSegundaParcela,
                            style: subHeaderTextStyle
                        ),
                        new Container(width: 5.0),
                        new Text("Situação: " + _ferias[index].situacaoSegundaParcela,
                            style: subHeaderTextStyle
                        ),
                      ],
                    ),
                    new Container(height: 2.0),
                    new Text("Terceira Parcela: " + _ferias[index].dataInicioTerceiraParcela + " à " + _ferias[index].dataFimTerceiraParcela,
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
                  color: Utils.corPadraoPortalServidor(),//new Color(0xFF333366),
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

              return new Container(
                height: 95.0,
                margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                child: Stack(
                  children: <Widget>[
                    sistemaCard,
                  ],
                ),
              );
            }
        )
    );
  }

  @override
  void retornaFeriasError(String msg) {
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

  @override
  void retornaFerias(List<Ferias> ferias) {
    setState(() {
      _ferias = ferias;
      _isLoadingFerias = false;
    });
  }
}



