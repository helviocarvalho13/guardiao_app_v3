import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:guardiao_app_v3/data/usuario/usuario_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProdUsuarioRepository implements UsuarioRepository{

  Future<String> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String autorizacao =  prefs.getString('token');
    return autorizacao;
  }

  /*final storage = new FlutterSecureStorage();

  Future<String> _getToken() async{
    return await storage.read(key: 'token');
  }*/

  //String retornaUsuarioUrl = "http://localhost:8080/guardiaomobile/identidadeFuncional/";

  String retornaUsuarioUrl = "https://apps.tre-ma.jus.br/guardiaomobile/identidadeFuncional/";

  @override
  Future<Usuario> retornaUsuario() async {
    var header = {"Authorization": await _getToken()};
    http.Response response = await http.get(retornaUsuarioUrl, headers: header);

    //final Usuario usuario = json.decode(response.body);
    final statusCode = response.statusCode;

    if (statusCode >= 400) {
      throw new FetchDataException(statusCode);
    }

    if (statusCode != 200) {
      throw new FetchDataException(statusCode);
    }

    final Usuario usuario = new Usuario.fromMap(json.decode(response.body)['identidade']);
    print(usuario);

    //return responseBody.map((c) => new Usuario.fromMap(c)).toSet();
    return new Future.value(usuario);
  }
}