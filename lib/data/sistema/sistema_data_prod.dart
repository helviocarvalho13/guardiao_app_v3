import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:guardiao_app_v3/data/sistema/sistema_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProdSistemaRepository implements SistemaRepository {

  Future<String> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String autorizacao = prefs.getString('token');
    return autorizacao;
  }

  /*final storage = new FlutterSecureStorage();

  Future<String> _getToken() async{
    return await storage.read(key: 'token');
  }*/

  String retornaSistemasUrl = "http://localhost:8080/guardiaomobile/sistemas/";
  //String retornaSistemasUrl = "https://apps.tre-ma.jus.br/guardiaomobile/sistemas/";

  @override
  Future<List<Sistema>> retornaSistemas() async {
    var header = {"Authorization": await _getToken()};
    http.Response response = await http.get(retornaSistemasUrl, headers: header);
    final Map<String, dynamic> responseBody = json.decode(response.body);
    List sistemas = responseBody["list"];
    final statusCode = response.statusCode;

    if (statusCode >= 400) {
      throw new FetchDataException(statusCode);
    }

    if (statusCode != 200 || responseBody == null) {
      throw new FetchDataException(statusCode);
    }
    return Future.value(sistemas.map((c) => new Sistema.fromMap(c)).toList());
  }
}