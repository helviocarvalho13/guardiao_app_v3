import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:guardiao_app_v3/data/autorizacao/autorizacao_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProdAutorizacaoRepository implements AutorizacaoRepository{

  _salvarAutorizacao(String autorizacao) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('autorizacao', autorizacao);
  }
  /*final storage = new FlutterSecureStorage();

  _salvarAutorizacao(String autorizacao) async{
    await storage.write(key: 'autorizacao', value: autorizacao);
  }*/

  @override
  Future<int> retornaAutorizacao(String username, String codigo) async{
    //var url = "http://localhost:8080/guardiaomobile/autenticacao/";
    var url = "https://apps.tre-ma.jus.br/guardiaomobile/autenticacao/";
    var body = {"titulo": username, "codigo": codigo};
    var autorizacao = 0;
    var response = await http.post(url, body: body);
    final statusCode = response.statusCode;
    if (statusCode == 200) {
      _salvarAutorizacao('1');
      autorizacao = 1;
    }

    if (statusCode != 200) {
      throw new FetchDataException("Código de Autenticação inválido!");
    }

    return new Future.value(autorizacao);
    //return new Future.value(1);
  }

}