import 'dart:async';
import 'package:guardiao_app_v3/data/autorizacao/autorizacao_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DevAutorizacaoRepository implements AutorizacaoRepository{

  _salvarAutorizacao(String autorizacao) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('autorizacao', autorizacao);
  }

  @override
  Future<int> retornaAutorizacao(String username, String codigo) async{
    _salvarAutorizacao('1');
    return new Future.value(1);
  }

}