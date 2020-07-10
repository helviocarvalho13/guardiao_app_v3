import 'dart:async';
import 'package:guardiao_app_v3/data/inicio/inicio_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DevInicioRepository implements InicioRepository{

  @override
  Future<int> retornaTokenValido() {
    return new Future.value(1);
  }
}