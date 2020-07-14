import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:guardiao_app_v3/data/servidor/ferias_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProdFeriasRepository implements FeriasRepository {

  //String retornaFeriasUrl = "http://localhost:8080/guardiaomobile/portalServidor/ferias";
  String retornaFeriasUrl = "https://apps.tre-ma.jus.br/guardiaomobile/portalServidor/ferias";

  Future<String> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String autorizacao = prefs.getString('token');
    return autorizacao;
  }

  @override
  Future<List<Ferias>> retornaFerias() async {
    var header = {"Authorization": await _getToken()};
    http.Response response = await http.get(retornaFeriasUrl, headers: header);
    final List responseBody = json.decode(response.body)['list'];
    final statusCode = response.statusCode;

    if (statusCode >= 400) {
      throw new FetchDataException(statusCode);
    }

    if (statusCode != 200 || responseBody == null) {
      throw new FetchDataException(statusCode);
    }

    List<Ferias> lista = responseBody.map((c) => new Ferias.fromMap(c)).toList();
    return lista;
  }
}