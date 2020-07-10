import 'package:flutter/material.dart';
import 'package:guardiao_app_v3/data/inicio/inicio_data.dart';
import 'package:guardiao_app_v3/config/dependency_injection.dart';


abstract class InicioViewContract {
  void retornaTokenValido(int valido);
}

class InicioPresenter {
  InicioViewContract _view;
  InicioRepository _inicioRepository;

  InicioPresenter(this._view) {
    _inicioRepository = new Injector().inicioRepository;
  }

  void retornaTokenValido() {
    _inicioRepository
        .retornaTokenValido()
        .then((valido) => _view.retornaTokenValido(valido));
  }
}