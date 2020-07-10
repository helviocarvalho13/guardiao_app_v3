import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:guardiao_app_v3/data/inicio/inicio_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProdInicioRepository implements InicioRepository {

  //String retornaTokenValidoUrl = "http://localhost:8080/guardiaomobile/validaToken";
  String retornaTokenValidoUrl = "https://apps.tre-ma.jus.br/guardiaomobile/validaToken";

  Future<String> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String autorizacao = prefs.getString('token');
    return autorizacao;
  }

  @override
  Future<int> retornaTokenValido() async {
    var body = {"token": await _getToken()};
    var tokenValido = 0;
    http.post(retornaTokenValidoUrl, body: body).then((response) {
      final statusCode = response.statusCode;
      if (statusCode == 200) {
        tokenValido = 1;
      }
    });
    return new Future.value(tokenValido);
  }

}