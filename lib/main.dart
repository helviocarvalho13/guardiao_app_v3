import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guardiao_app_v3/config/dependency_injection.dart';
import 'package:guardiao_app_v3/pages/preview/PreviewPage.dart';
import 'package:guardiao_app_v3/pages/guardiao/GuardiaoPage.dart';
import 'package:guardiao_app_v3/pages/autorizacao/AutorizacaoPage.dart';
import 'package:guardiao_app_v3/pages/login/LoginPage.dart';
import 'package:guardiao_app_v3/pages/clube_parceria/ClubeParceriaPage.dart';
import 'package:guardiao_app_v3/pages/clube_parceria/ParceriasPage.dart';
import 'package:guardiao_app_v3/pages/carteira_funcional/CarteiraFuncionalFrontPage.dart';
import 'package:guardiao_app_v3/pages/carteira_funcional/CarteiraFuncionalBackPage.dart';
import 'package:guardiao_app_v3/pages/clube_parceria/ExibirParceriaPage.dart';
import 'package:guardiao_app_v3/pages/clube_parceria/DescricaoClubeParceriaPage.dart';
import 'package:guardiao_app_v3/pages/portal_servidor/PortalServidorPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  Injector.configure(Flavor.PROD);
  runApp(InicioPage());
}

final routes = {
  '/previewPage': (BuildContext context)                => new PreviewPage(),
  '/autorizacaoPage': (BuildContext context)            => new AutorizacaoPage(),
  '/loginPage': (BuildContext context)                  => new LoginPage(),
  '/guardiaoPage': (BuildContext context)               => new GuardiaoPage(),
  '/carteiraFuncionalFrontPage': (BuildContext context) => new CarteiraFuncionalFrontPage(),
  '/carteiraFuncionalBackPage': (BuildContext context)  => new CarteiraFuncionalBackPage(),
  '/clubeParceriaPage': (BuildContext context)          => new ClubeParceriaPage(),
  '/clubeParceriaPage/parcerias': (BuildContext context)=> new ParceriasPage(),
  '/clubeParceriaPage/parceria/exibir': (BuildContext context)=> new ExibirParceriaPage(),
  '/clubeParceriaPage/clubeParcerias': (BuildContext context)=> new DescricaoClubeParceriaPage(),
  '/portalServidor': (BuildContext context) => new PortalServidorPage(),
};

class InicioPage extends StatefulWidget {
  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage>{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Guardião - TRE/MA',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/previewPage',//retornaScreen(),
        routes: routes,
        home: new PreviewPage()//retornaHome(),
    );
  }
}