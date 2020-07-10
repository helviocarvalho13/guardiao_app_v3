import 'package:guardiao_app_v3/data/login/login_data.dart';
import 'package:guardiao_app_v3/config/dependency_injection.dart';

abstract class LoginViewContract {
  void login(int login);
  void loginError(String msg);
}

class LoginPresenter {
  LoginViewContract _view;
  LoginRepository _repository;

  LoginPresenter(this._view){
    _repository = new Injector().loginRepository;
  }

  void retornaLogin(String username, String password){
    _repository.retornaLogin(username, password)
        .then((a) => _view.login(a))
        .catchError((onError) => _view.loginError(onError.toString()));
  }

}