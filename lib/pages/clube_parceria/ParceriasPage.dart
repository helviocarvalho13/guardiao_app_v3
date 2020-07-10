import 'package:flutter/material.dart';
import 'package:guardiao_app_v3/pages/clube_parceria/Menu.dart';
import 'package:guardiao_app_v3/pages/clube_parceria/Header.dart';
import 'package:guardiao_app_v3/pages/clube_parceria/HomeGuardiao.dart';
import 'package:guardiao_app_v3/data/parceria/parceria_data.dart';
import 'package:guardiao_app_v3/data/usuario/usuario_data.dart';
import 'package:guardiao_app_v3/pages/clube_parceria/ExibirParceriaDTO.dart';
import 'package:guardiao_app_v3/pages/clube_parceria/ClubeParceriaDTO.dart';
import 'package:guardiao_app_v3/modules/parceria/parceria_presenter.dart';
import 'package:guardiao_app_v3/util/Utils.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ParceriasPage extends StatefulWidget {
  @override
  _ParceriasPageState createState() => _ParceriasPageState();
}

class _ParceriasPageState extends State<ParceriasPage> implements ParceriaViewContract{

  ParceriaPresenter _parceriaPresenter;
  final _scaffoldKey                = new GlobalKey<ScaffoldState>();
  bool _isLoading;
  bool _isLoadingParcerias;
  List<Parceria> _parcerias;
  List<Parceria> _parceriasTemp;
  Usuario _usuario;
  TextEditingController controller = new TextEditingController();
  String filter;

  _ParceriasPageState(){
    _parceriaPresenter  = new ParceriaPresenter(this);
  }

  @override
  void initState(){
    super.initState();
    _isLoading = true;
    _parceriaPresenter.retornaParcerias();
    controller.addListener(() {
      setState(() {
        filter = controller.text;
      });
      _parceriasTemp = _parcerias;
    });
  }

 /* @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    Usuario usuario = ModalRoute.of(context).settings.arguments;
    _usuario = usuario;
    return new Scaffold(
        key: _scaffoldKey,
        appBar: Header(context),
        drawer: Menu(context, _usuario),
        body: new Container(
          color: Utils.hexToColor('#FFFFFF'),
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.all(20.0),
                child: new TextField(
                  decoration: new InputDecoration(
                    labelText: "Filtrar parcerias...",
                    icon: new Icon(Icons.zoom_in),
                  ),
                  controller: controller,
                ),
              ),
              new Expanded(
                  child: new ListView.builder(
                      itemCount: (_parceriasTemp == null || _parceriasTemp.isEmpty) ? 0 : _parceriasTemp.length,
                      itemBuilder: (BuildContext context, int index){
                        retornaListaParcerias(_usuario, _parceriasTemp, index, context);
                        return filter == null || filter == "" ? retornaListaParcerias(_usuario, _parceriasTemp, index, context)
                            : (_parceriasTemp[index].nome.toLowerCase().startsWith(filter.toLowerCase())
                            || _parceriasTemp[index].nome.toLowerCase().contains(filter.toLowerCase())
                            || _parceriasTemp[index].bairro.toLowerCase().startsWith(filter.toLowerCase())
                            || _parceriasTemp[index].bairro.toLowerCase().contains(filter.toLowerCase())
                            || _parceriasTemp[index].retornaRamoAtividade().toLowerCase().startsWith(filter.toLowerCase())
                            || _parceriasTemp[index].retornaRamoAtividade().toLowerCase().contains(filter.toLowerCase())
                        ) ? retornaListaParcerias(_usuario, _parceriasTemp, index, context) : new Column();
                      }
                  )
              )
            ],
          ),
        ),
        floatingActionButton: HomeGuardiao(context),
    );
  }

  @override
  void retornaParceriaError(String msg) {
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
  void retornaParcerias(List<Parceria> parcerias) {
    setState(() {
      _parcerias = parcerias;
      _parceriasTemp = _parcerias;
      _isLoading = false;
    });
  }
}

Widget retornaLogomarca(Parceria parceria){
  if(parceria.logomarcaUrl!= null && parceria.logomarcaUrl != ''){
    return new Image.network(parceria.logomarcaUrl, height: 92.0, width: 92.0);
    /*return new CachedNetworkImage(
      placeholder: (context, url) => new CircularProgressIndicator(),
      imageUrl: parceria.logomarcaUrl,
      height: 92.0,
      width: 92.0,
      errorWidget: (context, url, error) => Image.asset('assets/imgs/noImage.png', height: 92.0,width: 92.0),
    );*/
  }else{
    return new Image.asset('assets/imgs/noImage.png', height: 92.0,width: 92.0);
  }
}

GestureDetector retornaListaParcerias(Usuario usuario, List<Parceria> _parcerias, int index, BuildContext context){

  final parceriaThumbnail = new Container(
      margin: new EdgeInsets.symmetric(vertical: 8.0),
      alignment: FractionalOffset.centerLeft,
      child: retornaLogomarca(_parcerias[index])
  );

  final baseTextStyle = const TextStyle(
      fontFamily: 'Poppins'
  );

  final headerTextStyle = baseTextStyle.copyWith(
      color: Colors.black,
      fontSize: 10.0,
      fontWeight: FontWeight.w600
  );

  final regularTextStyle = baseTextStyle.copyWith(
      color: Colors.black,
      fontSize: 9.0,
      fontWeight: FontWeight.w400
  );

  final subHeaderTextStyle = regularTextStyle.copyWith(
      fontSize: 8.0
  );

  final parceriaCardContent = new Container(

    margin: new EdgeInsets.fromLTRB(76.0, 8.0, 16.0, 8.0),
    constraints: new BoxConstraints.expand(),
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Container(height: 16.0),
        new Text(_parcerias[index].nome,
          style: headerTextStyle,
        ),
        /*new Container(height: 4.0),
        new Text(_parcerias[index].endereco,
            style: subHeaderTextStyle
        ),*/
      ],
    ),
  );

  final parceriaCard = new Container(
    child: parceriaCardContent,
    height: 70.0,
    margin: new EdgeInsets.only(left: 46.0),
    decoration: new BoxDecoration(
      color: Utils.hexToColor('#D7F1FD'),//new Color(0xFF333366),
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
    onTap: () => Navigator.of(context).pushNamed('/clubeParceriaPage/parceria/exibir',
        arguments: new ExibirParceriaDTO(usuario, _parcerias[index])),
    child: new Container(
        height: 70.0,
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: new Stack(
          children: <Widget>[
            parceriaCard,
            parceriaThumbnail,
          ],
        )
    ),
  );
}
