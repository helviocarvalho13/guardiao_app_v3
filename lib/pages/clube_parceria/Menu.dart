import 'package:flutter/material.dart';
import 'package:guardiao_app_v3/data/usuario/usuario_data.dart';
import 'package:guardiao_app_v3/util/Utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';

Drawer Menu(BuildContext context, Usuario usuario){
  return new Drawer(
    child: new ListView(
      children: <Widget>[
        new UserAccountsDrawerHeader(
          accountName: Text(usuario.matricula+' - '+ usuario.nome),
          accountEmail: Text(usuario.cargo+' - '+ usuario.lotacaoSigla),
          currentAccountPicture: new CircleAvatar(
              backgroundImage: new CachedNetworkImageProvider(usuario.foto34Url)
          ),
          decoration: new BoxDecoration(color: Utils.corPadraoClubeParceria()),
        ),
        new ListTile(
          leading: new Icon(Icons.home),
          title: new Text('Inicio'),
          trailing: new Icon(Icons.arrow_forward),
          onTap: () => Navigator.of(context).pushNamed('/clubeParceriaPage', arguments: usuario),
        ),
        new ListTile(
          leading: new Icon(Icons.info),
          title: new Text('Quem somos ?'),
          trailing: new Icon(Icons.arrow_forward),
          onTap: () => Navigator.of(context).pushNamed('/clubeParceriaPage/clubeParcerias', arguments: usuario),
        ),
        new ListTile(
          leading: new Icon(Icons.list),
          title: new Text('Parcerias firmadas'),
          trailing: new Icon(Icons.arrow_forward),
          onTap: () => Navigator.of(context).pushNamed('/clubeParceriaPage/parcerias', arguments: usuario),
        ),
        new ListTile(
          leading: new Icon(Icons.contact_mail),
          title: new Text('Sugestão de Parcerias'),
          trailing: new Icon(Icons.arrow_forward),
          onTap: () => launch("mailto:parcerias@tre-ma.jus.br?subject=Sugestão de Parceria&body="
              +"Olá amigos do Clube de Parcerias, "+"estou entrando em contato para sugerir a seguinte parceria: "
              +"Nome:_______; "
              +"Contato:_________; "
              +"Email:_________; "),
        ),
        new ListTile(
          leading: new Icon(Icons.contact_phone),
          title: new Text('Fale Conosco'),
          trailing: new Icon(Icons.arrow_forward),
          onTap: () => launch('whatsapp://send?phone=+5598992029041'),
        ),
        new ListTile(
          leading: new Icon(Icons.person),
          title: new Text('Identidade Funcional'),
          trailing: new Icon(Icons.arrow_forward),
          onTap: () => Navigator.of(context).pushNamed('/carteiraFuncionalFrontPage', arguments: usuario),
        ),
      ],
    ),


  );
}