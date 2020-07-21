import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:guardiao_app_v3/data/login/login_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProdLoginRepository implements LoginRepository{

  _salvarLogin(String token) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.setString('token', token);
  }

  /*final storage = new FlutterSecureStorage();

  _salvarLogin(String token) async{
    await storage.write(key: 'token', value: token);
  }*/

  @override
  Future<int> retornaLogin(String username, String password) async{
    //var url = "http://localhost:8080/guardiaomobile/login/";
    var url = "https://apps.tre-ma.jus.br/guardiaomobile/login/";
    var body = {"login": username, "senha": password};
    //var header = {"Accept": "application/x-www-form-urlencoded"};
    var login = 0;

    var response = await http.post(Uri.parse(url), body: body);
    final statusCode = response.statusCode;
    if (statusCode == 200) {
      var temp = jsonDecode(response.body);
      await _salvarLogin(temp["jwt"]);
      login = 1;
    }

    if (statusCode == 401) {
      throw new FetchDataException("Usuário e/ou senha inválidos!");
    }

    if (statusCode != 200) {
      throw new FetchDataException("Erro no servidor! - "+statusCode.toString());
    }
    return new Future.value(login);
  }

}