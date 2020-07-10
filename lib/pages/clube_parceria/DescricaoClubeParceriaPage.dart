import 'package:flutter/material.dart';
import 'package:guardiao_app_v3/data/usuario/usuario_data.dart';
import 'package:guardiao_app_v3/util/Utils.dart';
import 'package:guardiao_app_v3/pages/clube_parceria/Menu.dart';
import 'package:guardiao_app_v3/pages/clube_parceria/Header.dart';
import 'package:guardiao_app_v3/pages/clube_parceria/HomeGuardiao.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:guardiao_app_v3/pages/clube_parceria/style/text_style.dart';
import 'package:guardiao_app_v3/pages/clube_parceria/style/Separator.dart';
import 'package:guardiao_app_v3/pages/clube_parceria/style/DescricaoClubeParceriaSummary.dart';

class DescricaoClubeParceriaPage extends StatefulWidget {
  @override
  _DescricaoClubeParceriaPageState createState() => _DescricaoClubeParceriaPageState();
}

class _DescricaoClubeParceriaPageState extends State<DescricaoClubeParceriaPage> {
  final _scaffoldKey                = new GlobalKey<ScaffoldState>();
  Usuario _usuario;

  _DescricaoClubeParceriaPageState(){}

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _usuario = ModalRoute.of(context).settings.arguments;
    return new Scaffold(
      key: _scaffoldKey,
      appBar: Header(context),
      drawer: Menu(context, _usuario),
      body: new Container(
        constraints: new BoxConstraints.expand(),
        color: Colors.white,//Utils.hexToColor('#d4f0ff'),
        child: new Stack(
          children: <Widget>[
            _getBackground(),
            _getGradient(),
            _getContent(),
            _getToolbar(context)
          ],
        ),
      ),
      floatingActionButton: HomeGuardiao(context),
    );
  }

  Container _getBackground(){
    return new Container(
      constraints: new BoxConstraints.expand(height: 300.0),
    );
  }

  Container _getGradient(){
    return new Container(
      margin: new EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: <Color>[
                Colors.white,//Utils.hexToColor('#d4f0ff'),
                Colors.white//Utils.hexToColor('#d4f0ff')
              ],
              stops: [0.0, 0.9],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.0, 1.0)
          )
      ),
    );
  }

  Container _getContent() {
    final _overviewTitle = 'Quem somos ?'.toUpperCase();
    return new Container(
      child: new ListView(
        padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 32.0),
        children: <Widget>[
          new DescricaoClubeParceriaSummary(),
          new Container(
            padding: new EdgeInsets.symmetric(horizontal: 20.0, vertical: 32.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(_overviewTitle,
                  style: Style.headerTextStyle,),
                new Separator(),
                new Column(
                  children: <Widget>[
                    new ListTile(
                      //leading: SizedBox(height: 35.0, child: Image.asset("assets/icons/info-icon.png")),
                      title: Text('Somos um clube de benefícios que tem como missão auxiliar os servidores em sua busca de qualidade de vida.'
                          +' \nPor meio de parcerias com empresas de diferentes ramos de atuação, oferecemos aos servidores descontos e vantagens exclusivos. '
                              '\nEm contrapartida, disponibilizamos aos parceiros um canal de publicidade de seus produtos e serviços, '
                              'estimulando a adesão de novos usuários.\n', style: Style.commonTextStyle, textAlign: TextAlign.justify,
                      ),
                      subtitle: Text('UM CLUBE \nQUE NÃO ECONOMIZA\nCONDIÇÕES ESPECIAIS PARA VOCÊ \n', style: Style.commonTextStyle),
                    ),
                  ],
                ),
                new Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                          child: Text("TOQUE NO ÍCONES PARA CONTATO COM O CLUBE DE PARCERIAS",
                            style: Style.headerTextStyle,
                          )
                      ),
                      new Separator(),
                      new Container(
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                              child: new Row(
                                children: <Widget>[
                                  new Expanded(
                                    child: retornaEmail('parcerias@tre-ma.jus.br', _scaffoldKey.currentContext),
                                  ),
                                  new Expanded(
                                    child: retornaSite(''),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: retornaFacebook(''),
                                  ),
                                  Expanded(
                                    child: retornaGoogleMaps('https://goo.gl/maps/C9EAyXx2ees4ALS79'),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                              child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: retornaInstagram(''),
                                    ),
                                    Expanded(
                                      child: retornaTelefone1('98321078777'),
                                    ),
                                  ]
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: retornaWhatsApp('98992029041', _scaffoldKey.currentContext),
                                  ),
                                  Expanded(
                                    child: retornaTelefone2('98321078941'),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
                /*new Text(
                    _parceria.nome,
                    style: Style.commonTextStyle),*/
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget retornaTelefone1(String telefone){
    if(telefone != ''){
      return new ListTile(
        title: Text('Telefone', style: Style.commonTextStyle),
        leading: SizedBox(height: 35.0, child: Image.asset("assets/icons/telephone-logo-1.png")),
        onTap: () => launch("tel://${telefone}"),
      );
    }else{
      return new ListTile(
        title: Text('Telefone', style: Style.commonTextStyle),
        leading: SizedBox(height: 35.0, child: Image.asset("assets/icons/telephone-logo-1-disabled.png")),
      );
    }
  }

  Widget retornaTelefone2(String telefone){
    if(telefone != ''){
      return new ListTile(
        title: Text('Telefone', style: Style.commonTextStyle),
        leading: SizedBox(height: 35.0, child: Image.asset("assets/icons/telephone-logo-2.png")),
        onTap: () => launch("tel://${telefone}"),
      );
    }else{
      return new ListTile(
        title: Text('Telefone', style: Style.commonTextStyle),
        leading: SizedBox(height: 35.0, child: Image.asset("assets/icons/telephone-logo-2-disabled.png")),
      );
    }
  }

  Widget retornaFacebook(String facebook){
    if(facebook != ''){
      return new ListTile(
        title: Text('Facebook', style: Style.commonTextStyle),
        leading: SizedBox(height: 35.0, child: Image.asset("assets/icons/facebook-logo.png") ),
        onTap: () => launch("${facebook}"),
      );
    }else{
      return new ListTile(
        title: Text('Facebook', style: Style.commonTextStyle),
        leading: SizedBox(height: 35.0, child: Image.asset("assets/icons/facebook-logo-disabled.png") ),
      );
    }
  }

  Widget retornaWhatsApp(String whatsApp, BuildContext context){
    if(whatsApp != ''){
      return new ListTile(
        title: Text('WhatsApp', style: Style.commonTextStyle),
        leading: SizedBox(height: 35.0, child: Image.asset("assets/icons/whatsapp-logo.png")),
        onTap: () => launchWhatsApp(whatsApp, context),
      );
    }else{
      return new ListTile(
        title: Text('WhatsApp', style: Style.commonTextStyle),
        leading: SizedBox(height: 35.0, child: Image.asset("assets/icons/whatsapp-logo-disabled.png")),
      );
    }
  }

  Widget retornaGoogleMaps(String googleMaps){
    if(googleMaps != ''){
      return new ListTile(
        title: Text('Localização', style: Style.commonTextStyle),
        leading: SizedBox(height: 35.0, child: Image.asset("assets/icons/google-maps-logo.png")),
        onTap: () => launch("${googleMaps}"),
      );
    }else{
      return new ListTile(
        title: Text('Localização', style: Style.commonTextStyle),
        leading: SizedBox(height: 35.0, child: Image.asset("assets/icons/google-maps-logo-disabled.png")),
      );
    }
  }

  Widget retornaInstagram(String instagram){
    if(instagram != ''){
      return new ListTile(
        title: Text('Instagram', style: Style.commonTextStyle),
        leading: SizedBox(height: 35.0, child: Image.asset("assets/icons/instagram-logo.png")),
        onTap: () => launchInstagram("${instagram}"),
      );
    }else{
      return new ListTile(
        title: Text('Instagram', style: Style.commonTextStyle),
        leading: SizedBox(height: 35.0, child: Image.asset("assets/icons/instagram-logo-disabled.png")),
      );
    }
  }

  Widget retornaSite(String site){
    if(site != null && site != ''){
      return new ListTile(
        title: Text('Site', style: Style.commonTextStyle),
        leading: SizedBox(height: 35.0, child: Image.asset("assets/icons/site-institucional-logo.png")),
        onTap: () => launch("$site"),
      );
    }else{
      return new ListTile(
        title: Text('Site', style: Style.commonTextStyle),
        leading: SizedBox(height: 35.0, child: Image.asset("assets/icons/site-institucional-logo-disabled.png")),
      );
    }
  }

  Widget retornaEmail(String email, BuildContext context) {
    if (email != null && email != '') {
      return new ListTile(
        title: Text('E-mail', style: Style.commonTextStyle),
        leading: SizedBox(
            height: 35.0,
            child: Image.asset("assets/icons/mail-logo.png")),
        onTap: () => launch("mailto:${email}"),
      );
    } else {
      return new ListTile(
        title: Text('E-mail', style: Style.commonTextStyle),
        leading: SizedBox(height: 35.0,
            child: Image.asset("assets/icons/mail-logo-disabled.png")),
      );
    }
  }

  void launchInstagram(String instagram){
    var instagramUrl = "https://www.instagram.com/$instagram";
    launch("${instagramUrl}");
  }

  void launchWhatsApp (String whatsapp, BuildContext context) async{
    var whatsappUrl ="whatsapp://send?phone=+55$whatsapp";
    await canLaunch(whatsappUrl)? launch(whatsappUrl): retornaError("Erro ao iniciar WhatsApp");
  }

  Container _getToolbar(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.only(
          top: MediaQuery
              .of(context)
              .padding
              .top),
      child: new BackButton(color: Colors.white),
    );
  }

 @override
  void retornaError(String msg) {
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

}
