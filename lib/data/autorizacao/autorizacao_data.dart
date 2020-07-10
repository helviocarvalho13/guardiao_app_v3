import 'dart:async';

class Autorizacao {
  String _username;
  String _codigo;

  Autorizacao(this._username, this._codigo);

  Autorizacao.fromMap(Map<String, dynamic> map)
      : _username = map['usuario'],
        _codigo = map['codigo'];

  String get username => _username;
  String get codigo => _codigo;
}

abstract class AutorizacaoRepository{
  Future<int> retornaAutorizacao(String username, String codigo);
}

class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}
