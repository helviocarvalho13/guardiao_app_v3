import 'package:guardiao_app_v3/data/parceria/parceria_data.dart';
import 'package:guardiao_app_v3/config/dependency_injection.dart';

abstract class ParceriaViewContract {
  void retornaParcerias(List<Parceria> parcerias);
  void retornaParceriaError(String statusCode);
}

class ParceriaPresenter{
  ParceriaViewContract _view;
  ParceriaRepository _parceriaRepository;

  ParceriaPresenter(this._view){
    _parceriaRepository = new Injector().parceriaRepository;
  }

  void retornaParcerias() async{
    await _parceriaRepository
        .retornaParcerias()
        .then((parcerias) => _view.retornaParcerias(parcerias))
        .catchError((onError) => _view.retornaParceriaError(onError.toString()));
  }
}