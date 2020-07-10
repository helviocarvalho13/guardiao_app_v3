import 'package:guardiao_app_v3/data/usuario/usuario_data.dart';
import 'package:guardiao_app_v3/config/dependency_injection.dart';

abstract class UsuarioViewContract {
  void retornaUsuario(Usuario usuario);
  void retornaUsuarioError(String statusCode);
}

class UsuarioPresenter {
  UsuarioViewContract _view;
  UsuarioRepository _usuarioRepository;

  UsuarioPresenter(this._view) {
    _usuarioRepository = new Injector().usuarioRepository;
  }

  void retornaUsuario() {
    _usuarioRepository
        .retornaUsuario()
        .then((usuario) => _view.retornaUsuario(usuario))
        .catchError((onError) => _view.retornaUsuarioError(onError.toString()));
  }
}