import 'package:guardiao_app_v3/data/sistema/sistema_data.dart';
import 'package:guardiao_app_v3/config/dependency_injection.dart';

abstract class SistemaViewContract {
  void retornaSistemas(List<Sistema> sistemas);
  void retornaSistemaError(String statusCode);
}

class SistemaPresenter {
  SistemaViewContract _view;
  SistemaRepository _sistemaRepository;

  SistemaPresenter(this._view) {
    _sistemaRepository = new Injector().sistemaRepository;
  }

  void retornaSistemas() {
    _sistemaRepository
        .retornaSistemas()
        .then((sistemas) => _view.retornaSistemas(sistemas))
        .catchError((onError) => _view.retornaSistemaError(onError.toString()));
  }

}