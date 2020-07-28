import 'dart:async';

class Parceria{

  String _id;
  String _renovacao;
  String _ramoAtividade;
  String _superRamoAtividade;
  String _nome;
  String _descricaoRamoAtividade;
  String _descontos;
  String _endereco;
  String _bairro;
  String _tempoDuracaoParceria;

  String _logomarcaUrl;
  String _tabelaInfoParceiroUrl;
  String _termoParceriaUrl;

  String _facebook;
  String _instagram;
  String _email;
  String _googleMaps;
  String _site;
  String _whatsapp;
  String _telefone1;
  String _telefone2;

  Parceria(this._id, this._renovacao, this._nome, this._ramoAtividade,
    this._superRamoAtividade, this._descricaoRamoAtividade, this._descontos,
  this._endereco, this._bairro, this._tempoDuracaoParceria, this._logomarcaUrl,
  this._tabelaInfoParceiroUrl, this._termoParceriaUrl, this._facebook, this._instagram, this._email, this._googleMaps,
  this._site, this._whatsapp, this._telefone1, this._telefone2);



  Parceria.fromMap(Map<String, dynamic> map)
  :      _id                     = map['id'],
        _renovacao              = map['renovacao'],
        _nome                   = map['nome'],
        _ramoAtividade          = map['ramoAtividade'],
        _superRamoAtividade     = map['superRamoAtividade'],
        _descricaoRamoAtividade = map['descricaoRamoAtividade'],
        _descontos              = map['descontos'],
        _endereco               = map['endereco'],
        _bairro                 = map['bairro'],
        _tempoDuracaoParceria   = map['tempoDuracao'],
        _logomarcaUrl           = map['logomarcaUrl'],
        _tabelaInfoParceiroUrl  = map['tabelaInfoParceiroUrl'],
        _termoParceriaUrl       = map['termoParceriaUrl'],
        _facebook               = map['facebook'],
        _instagram              = map['instagram'],
        _email                  = map['email'],
        _googleMaps             = map['googleMaps'],
        _site                   = map['site'],
        _whatsapp               = map['whatsapp'],
        _telefone1              = map['telefone1'],
        _telefone2              = map['telefone2'];

  String get id                     => _id;
  String get renovacao              => _renovacao;
  String get nome                   => _nome;
  String get ramoAtividade          => _ramoAtividade;
  String get superRamoAtividade     => _superRamoAtividade;
  String get descricaoRamoAtividade => _descricaoRamoAtividade;
  String get descontos              => _descontos;
  String get endereco               => _endereco;
  String get bairro                 => _bairro;
  String get tempoDuracaoParceria   => _tempoDuracaoParceria;
  String get logomarcaUrl           => _logomarcaUrl;
  String get tabelaInfoParceiroUrl  => _tabelaInfoParceiroUrl;
  String get termoParceriaUrl       => _termoParceriaUrl;
  String get facebook               => _facebook;
  String get instagram              => _instagram;
  String get email                  => _email;
  String get googleMaps             => _googleMaps;
  String get site                   => _site;
  String get whatsApp               => _whatsapp;
  String get telefone1              => _telefone1;
  String get telefone2              => _telefone2;

  String retornaRamoAtividade() {
    String ramoAtividade = '';
    if (this.superRamoAtividade != '') {
      ramoAtividade = this.superRamoAtividade  + '\n' + this.ramoAtividade;
    } else {
      ramoAtividade = this.ramoAtividade + '';
    }
    return ramoAtividade;
  }

}

abstract class ParceriaRepository{
  Future<List<Parceria>> retornaParcerias();
}

class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}