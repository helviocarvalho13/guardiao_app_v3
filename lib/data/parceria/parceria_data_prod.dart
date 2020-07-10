import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:guardiao_app_v3/data/parceria/parceria_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

class ProdParceriaRepository implements ParceriaRepository {

  //String retornaParceriasUrl = "http://localhost:8080/guardiaomobile/parcerias/";
  String retornaParceriasUrl = "https://apps.tre-ma.jus.br/guardiaomobile/parcerias/";

  Future<String> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String autorizacao = prefs.getString('token');
    return autorizacao;
  }

  @override
  Future<List<Parceria>> retornaParcerias() async {
    var header = {"Authorization": await _getToken()};
    http.Response response = await http.get(retornaParceriasUrl, headers: header);
    final List responseBody = json.decode(response.body)['list'];
    final statusCode = response.statusCode;

    if (statusCode >= 400) {
      throw new FetchDataException(statusCode);
    }

    if (statusCode != 200 || responseBody == null) {
      throw new FetchDataException(statusCode);
    }

    List<Parceria> lista = responseBody.map((c) => new Parceria.fromMap(c))
        .toList();
    lista.sort(
            (a, b) {
          return a.nome.toLowerCase().compareTo(b.nome.toLowerCase());
        });
    return lista;
  }
}
