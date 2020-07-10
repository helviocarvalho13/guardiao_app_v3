import 'package:flutter/material.dart';
import 'package:guardiao_app_v3/pages/clube_parceria/style/Separator.dart';
import 'package:guardiao_app_v3/data/parceria/parceria_data.dart';
import 'package:guardiao_app_v3/pages/clube_parceria/ExibirParceriaPage.dart';
import 'package:guardiao_app_v3/pages/clube_parceria/style/text_style.dart';
import 'package:guardiao_app_v3/util/Utils.dart';

class DescricaoClubeParceriaSummary extends StatelessWidget {

  DescricaoClubeParceriaSummary();

  @override
  Widget build(BuildContext context) {

    final descricaoClubeParceriaThumbnail = new Container(
      margin: new EdgeInsets.symmetric(
          vertical: 0.0
      ),
      alignment: FractionalOffset.center,
      child: new Hero(
        tag: "clubeParceria-hero",
        child: new Image(
          image: new AssetImage('assets/icons/clube-parceria-logo_v2.png'),
          height: 100.0,
          width: 100.0,
        ),
      ),
    );

    final descricaoClubeParceriaCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(height: 4.0),
          new Text('CLUBE DE PARCERIA', style: Style.titleTextStyle),
          new Container(height: 4.0),
          new Text('Av. Senador Vitorino Freire, Areinha, São Luís - MA, CEP: 65.010-917', style: Style.commonTextStyle),
        ],
      ),
    );


    final descricaoClubeParceriaCard = new Container(
      child: descricaoClubeParceriaCardContent,
      height: 123.0,
      margin: new EdgeInsets.only(top: 72.0),
      decoration: new BoxDecoration(
        color: Utils.hexToColor('#D7F1FD'),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Utils.hexToColor('#849FA8'),
            blurRadius: 10.0,
            offset: new Offset(10.0, 10.0),
          ),
        ],
      ),
    );


    return new GestureDetector(
        child: new Container(
          margin: const EdgeInsets.symmetric(
            vertical: 0.0,
            horizontal: 24.0,
          ),
          child: new Stack(
            children: <Widget>[
              descricaoClubeParceriaCard,
              descricaoClubeParceriaThumbnail,
            ],
          ),
        )
    );
  }
}