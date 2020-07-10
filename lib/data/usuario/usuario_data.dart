import 'dart:async';

class Usuario {
  String _matricula;
  String _nome;
  String _cargo;
  String _lotacaoSigla;
  String _lotacaoDescricao;
  String _dataNascimento;
  String _dataExercicio;
  String _cpf;
  String _tituloEleitor;
  String _rg;
  String _orgaoEmissoRG;
  String _dataEmissaoRG;
  String _pisPasep;
  String _nomePai;
  String _nomeMae;
  String _naturalidade;
  String _nacionalidade;
  String _dataEmissaoCarteiraFuncional;
  String _sangueRH;
  String _foto34Url;
  String _impressaoDigitalUrl;
  String _assinaturaUrl;
  String _frenteIdentidadeFuncionalUrl;
  String _versoIdentidadeFuncionalUrl;

  Usuario(this._matricula, this._nome, this._cargo, this._lotacaoSigla, this._lotacaoDescricao,this._dataNascimento, this._dataExercicio, this._cpf, this._tituloEleitor,
      this._rg, this._orgaoEmissoRG, this._dataEmissaoRG, this._pisPasep, this._nomePai, this._nomeMae, this._naturalidade,
      this._nacionalidade, this._dataEmissaoCarteiraFuncional, this._sangueRH, this._foto34Url, this._impressaoDigitalUrl,
      this._assinaturaUrl, this._frenteIdentidadeFuncionalUrl, this._versoIdentidadeFuncionalUrl);

  Usuario.fromMap(Map<String, dynamic> map)
      : _matricula  = map['matricula'],
        _nome       = map['nome'],
        _cargo      = map['cargo'],
        _lotacaoSigla    = map['lotacaoSigla'],
        _lotacaoDescricao    = map['lotacaoDescricao'],
        _dataNascimento    = map['dataNascimento'],
        _dataExercicio    = map['dataPosse'],
        _cpf    = map['cpf'],
        _tituloEleitor = map['tituloEleitor'],
        _rg = map['rg'],
        _orgaoEmissoRG = map['orgaoExpRg'],
        _dataEmissaoRG = map['dataEmissaoRg'],
        _pisPasep = map['pisPasep'],
        _nomePai = map['nomePai'],
        _nomeMae = map['nomeMae'],
        _naturalidade = map['municipioNascimento']+"-"+map['estadoNascimento'],
        _nacionalidade = map['nacionalidade'],
        _dataEmissaoCarteiraFuncional = map['dataEmissaoCarteiraFuncional'],
        _sangueRH = map['tipoSanguinio'],
        _foto34Url = map['fotoCrachaUrl'],
        _impressaoDigitalUrl = map['digitalIdentidadeFuncionalUrl'],
        _assinaturaUrl = map['assinaturaIdentidadeFuncionalUrl'],
        _frenteIdentidadeFuncionalUrl = map['frenteIdentidadeFuncionalUrl'],
        _versoIdentidadeFuncionalUrl = map['versoIdentidadeFuncionalUrl'];


  String get matricula  => _matricula;
  String get nome       => _nome;
  String get cargo      => _cargo;
  String get lotacaoSigla    => _lotacaoSigla;
  String get lotacaoDescricao    => _lotacaoDescricao;
  String get dataNascimento    => _dataNascimento;
  String get dataExercicio    => _dataExercicio;
  String get cpf    => _cpf;
  String get tituloEleitor    => _tituloEleitor;
  String get rg    => _rg;
  String get orgaoEmissoRG    => _orgaoEmissoRG;
  String get dataEmissaoRG    => _dataEmissaoRG;
  String get pisPasep    => _pisPasep;
  String get nomePai    => _nomePai;
  String get nomeMae    => _nomeMae;
  String get naturalidade    => _naturalidade;
  String get nacionalidade    => _nacionalidade;
  String get dataEmissaoCarteiraFuncional    => _dataEmissaoCarteiraFuncional;
  String get sangueRH    => _sangueRH;
  String get foto34Url    => _foto34Url;
  String get impressaoDigitalUrl    => _impressaoDigitalUrl;
  String get assinaturaUrl    => _assinaturaUrl;
  String get frenteIdentidadeFuncionalUrl    => _frenteIdentidadeFuncionalUrl;
  String get versoIdentidadeFuncionalUrl    => _versoIdentidadeFuncionalUrl;

}

abstract class UsuarioRepository{
  Future<Usuario> retornaUsuario();
}

class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}