import 'package:guardiao_app_v3/data/autorizacao/autorizacao_data.dart';
import 'package:guardiao_app_v3/config/dependency_injection.dart';

abstract class AutorizacaoViewContract {
  void autorizar(int autorizacao);
  void autorizarError(String msg);
}

class AutorizacaoPresenter {
  AutorizacaoViewContract _view;
  AutorizacaoRepository _repository;

  AutorizacaoPresenter(this._view){
    _repository = new Injector().autorizacaoRepository;
  }

  void retornaAutorizacao(String username, String codigo){
    _repository.retornaAutorizacao(username, codigo)
    .then((a) => _view.autorizar(a))
    .catchError((onError) => _view.autorizarError(onError.toString()));
  }

}

