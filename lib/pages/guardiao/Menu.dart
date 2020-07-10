import 'package:flutter/material.dart';
import 'package:guardiao_app_v3/data/usuario/usuario_data.dart';
import 'package:guardiao_app_v3/util/Utils.dart';
import 'package:cached_network_image/cached_network_image.dart';

Drawer Menu(BuildContext context, Usuario usuario){
  return new Drawer(
    child: new ListView(
      children: <Widget>[
        new UserAccountsDrawerHeader(
          accountName: Text(usuario.matricula+' - '+usuario.nome),
          accountEmail: Text(usuario.cargo+' - '+usuario.lotacaoSigla),
          currentAccountPicture: new CircleAvatar(
            backgroundColor: Colors.blueGrey,
           backgroundImage: new CachedNetworkImageProvider(usuario.foto34Url),
          ),
          decoration: new BoxDecoration(color: Utils.corPadraoGuardiao()),
        ),
        /*new ListTile(
          leading: new Icon(Icons.info),
          title: new Text('Sobre'),
          trailing: new Icon(Icons.arrow_forward),
        )*/
      ],
    ),
  );
}