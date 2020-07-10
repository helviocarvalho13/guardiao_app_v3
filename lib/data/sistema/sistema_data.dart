import 'dart:async';

class Sistema {
  String _id;
  String _categoriaSistema;
  String _sigla;
  String _nome;
  String _cor;
  String _observacao;
  String _iconeUrl;

  Sistema(this._id, this._categoriaSistema, this._sigla, this._nome, this._cor, this._observacao, this._iconeUrl);

  Sistema.fromMap(Map<String, dynamic> map)
      : _id               = map['id'],
        _categoriaSistema = map['categoriaSistema'],
        _sigla            = map['sigla'],
        _nome             = map['nome'],
        _cor              = map['cor'],
        _observacao       = map['observacao'],
        _iconeUrl         = map['iconeUrl'];

  String get id               => _id;
  String get categoriaSistema => _categoriaSistema;
  String get sigla            => _sigla;
  String get nome             => _nome;
  String get cor              => _cor;
  String get observacao       => _observacao;
  String get iconeUrl         => _iconeUrl;
}

abstract class SistemaRepository{
  Future<List<Sistema>> retornaSistemas();
}

class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }

}