import 'dart:async';

class Ferias {

  String _id;
  String _periodo;

  String get periodo => _periodo;
  String _dataInicioPrimeiraParcela;
  String _dataFimPrimeiraParcela;
  String _dataInicioSegundaParcela;
  String _dataFimSegundaParcela;
  String _dataInicioTerceiraParcela;
  String _dataFimTerceiraParcela;
  String _dataInicioAquisicao;
  String _dataFimAquisicao;
  String _situacaoFinalFerias;
  String _situacaoPrimeiraParcela;
  String _situacaoSegundaParcela;
  String _situacaoTerceiraParcela;

  Ferias(this._id, this._periodo, this._dataInicioPrimeiraParcela, this._dataFimPrimeiraParcela, this._dataInicioSegundaParcela, this._dataFimSegundaParcela,
      this._dataInicioTerceiraParcela, this._dataFimTerceiraParcela, this._dataInicioAquisicao, this._dataFimAquisicao, this._situacaoFinalFerias, this._situacaoPrimeiraParcela,
      this._situacaoSegundaParcela, this._situacaoTerceiraParcela);

  Ferias.fromMap(Map<String, dynamic> map):
        _id                       = map['id'],
        _periodo   = map['periodo'],
        _dataInicioPrimeiraParcela      = map['dataInicioPrimeiraParcela'],
        _dataFimPrimeiraParcela    = map['dataFimPrimeiraParcela'],
        _dataInicioSegundaParcela       = map['dataInicioSegundaParcela'],
        _dataFimSegundaParcela   = map['dataFimSegundaParcela'],
        _dataInicioTerceiraParcela      = map['dataInicioTerceiraParcela'],
        _dataFimTerceiraParcela = map['dataFimTerceiraParcela'],
        _dataInicioAquisicao = map['dataInicioAquisicao'],
        _dataFimAquisicao = map['dataFimAquisicao'],
        _situacaoFinalFerias = map['situacaoFinalFerias'],
        _situacaoPrimeiraParcela = map['situacaoPrimeiraParcela'],
        _situacaoSegundaParcela = map['situacaoSegundaParcela'],
        _situacaoTerceiraParcela = map['situacaoTerceiraParcela'];

  String get dataInicioPrimeiraParcela => _dataInicioPrimeiraParcela;

  String get dataFimPrimeiraParcela => _dataFimPrimeiraParcela;

  String get dataInicioSegundaParcela => _dataInicioSegundaParcela;

  String get dataFimSegundaParcela => _dataFimSegundaParcela;

  String get dataInicioTerceiraParcela => _dataInicioTerceiraParcela;

  String get dataFimTerceiraParcela => _dataFimTerceiraParcela;

  String get dataInicioAquisicao => _dataInicioAquisicao;

  String get dataFimAquisicao => _dataFimAquisicao;

  String get situacaoFinalFerias => _situacaoFinalFerias;

  String get situacaoPrimeiraParcela => _situacaoPrimeiraParcela;

  String get situacaoSegundaParcela => _situacaoSegundaParcela;

  String get situacaoTerceiraParcela => _situacaoTerceiraParcela;
}

abstract class FeriasRepository{
  Future<List<Ferias>> retornaFerias();
}

class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}