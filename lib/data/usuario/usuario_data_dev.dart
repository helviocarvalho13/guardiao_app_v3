import 'dart:async';
import 'package:guardiao_app_v3/data/usuario/usuario_data.dart';

class DevUsuarioRepository implements UsuarioRepository{

  @override
  Future<Usuario> retornaUsuario() async{
    return new Future.value(usuario);
  }

  var usuario = new Usuario('99999999', 'EGÍDIO DE CARVALHO RIBEIRO JÚNIOR', 'CHEFE DE SEÇÃO', 'SEADB', 'SEÇÃO DE ANÁLISE, DESENVOLVIMENTO DE SISTEMAS E BANCO DE DADOS', '99/99/9999', '99/99/9999', '999.999.999-99', '0285.5685.1120',
      '9999999', 'SSP', '99/99/9999', '9999999', 'TESTE TESTE TESTE TESTE', 'TESTE TESTE TESTE TESTE',
      'CIDADE/UF', 'BRASILEIRO', '99/99/9999',
      'A+', 'LINK', 'LINK', 'LINK', '', '');

}