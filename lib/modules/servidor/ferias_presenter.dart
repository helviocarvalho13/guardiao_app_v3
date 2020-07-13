import 'package:guardiao_app_v3/data/servidor/ferias_data.dart';
import 'package:guardiao_app_v3/config/dependency_injection.dart';

abstract class FeriasViewContract {
  void retornaFerias(List<Ferias> ferias);
  void retornaFeriasError(String statusCode);
}

class FeriasPresenter{
  FeriasViewContract _view;
  FeriasRepository _feriasRepository;

  FeriasPresenter(this._view){
    _feriasRepository = new Injector().feriasRepository;
  }

  void retornaFerias() async{
    await _feriasRepository
        .retornaFerias()
        .then((ferias) => _view.retornaFerias(ferias))
        .catchError((onError) => _view.retornaFeriasError(onError.toString()));
  }
}