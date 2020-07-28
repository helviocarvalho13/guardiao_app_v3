import 'package:flutter/material.dart';
import 'package:guardiao_app_v3/data/parceria/parceria_data.dart';
import 'package:guardiao_app_v3/pages/clube_parceria/style/text_style.dart';
import 'package:guardiao_app_v3/util/Utils.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ParceriaSummary extends StatelessWidget {

  final Parceria parceria;

  ParceriaSummary(this.parceria);

  @override
  Widget build(BuildContext context) {

    Widget retornaLogomarca(Parceria parceria){
      if(parceria.logomarcaUrl!= null && parceria.logomarcaUrl != ''){
        //return new Image.network(parceria.logomarcaUrl, height: 92.0, width: 92.0,);//new Image.asset('assets/imgs/logo_tre_01.png', height: 92.0,width: 92.0);
        return new CachedNetworkImage(
          placeholder: (context, url) => new CircularProgressIndicator(),
          imageUrl: parceria.logomarcaUrl,
          height: 92.0,
          width: 92.0,
        );
      }else{
        return new Image.asset('assets/imgs/noImage.png', height: 92.0,width: 92.0);
      }
    }

    final parceriaThumbnail = new Container(
      margin: new EdgeInsets.symmetric(
          vertical: 0.0
      ),
      alignment: FractionalOffset.center,
      child: new Hero(
        tag: "planet-hero-${parceria.id}",
        child: retornaLogomarca(parceria),
      ),
    );

    final parceriaCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(16.0, 42.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(parceria.nome, style: Style.titleTextStyle),
          new Container(height: 4.0),
          new Text(parceria.endereco != null ? parceria.endereco : '' +' - '+parceria.bairro != null ? parceria.bairro : '', style: Style.commonTextStyle),
        ],
      ),
    );


    final parceriaCard = new Container(
      child: parceriaCardContent,
      height: 189.0,
      margin: new EdgeInsets.only(top: 50.0),
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
              parceriaCard,
              parceriaThumbnail,
            ],
          ),
        )
    );
  }
}