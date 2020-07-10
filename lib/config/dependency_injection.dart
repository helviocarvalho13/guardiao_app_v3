import 'package:guardiao_app_v3/data/autorizacao/autorizacao_data.dart';
import 'package:guardiao_app_v3/data/autorizacao/autorizacao_data_dev.dart';
import 'package:guardiao_app_v3/data/autorizacao/autorizacao_data_prod.dart';

import 'package:guardiao_app_v3/data/login/login_data.dart';
import 'package:guardiao_app_v3/data/login/login_data_dev.dart';
import 'package:guardiao_app_v3/data/login/login_data_prod.dart';

import 'package:guardiao_app_v3/data/sistema/sistema_data.dart';
import 'package:guardiao_app_v3/data/sistema/sistema_data_dev.dart';
import 'package:guardiao_app_v3/data/sistema/sistema_data_prod.dart';

import 'package:guardiao_app_v3/data/usuario/usuario_data.dart';
import 'package:guardiao_app_v3/data/usuario/usuario_data_dev.dart';
import 'package:guardiao_app_v3/data/usuario/usuario_data_prod.dart';

import 'package:guardiao_app_v3/data/parceria/parceria_data.dart';
import 'package:guardiao_app_v3/data/parceria/parceria_data_dev.dart';
import 'package:guardiao_app_v3/data/parceria/parceria_data_prod.dart';

import 'package:guardiao_app_v3/data/inicio/inicio_data.dart';
import 'package:guardiao_app_v3/data/inicio/inicio_data_dev.dart';
import 'package:guardiao_app_v3/data/inicio/inicio_data_prod.dart';

enum Flavor { DEV, HOMOLOG, PROD }

//DI
class Injector {
  static final Injector _singleton = new Injector._internal();
  static Flavor _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  AutorizacaoRepository get autorizacaoRepository {
    switch (_flavor) {
      case Flavor.DEV:
        return new DevAutorizacaoRepository();
      default:
        return new ProdAutorizacaoRepository();
    }
  }

  LoginRepository get loginRepository {
    switch (_flavor) {
      case Flavor.DEV:
        return new DevLoginRepository();
      default:
        return new ProdLoginRepository();
    }
  }

  SistemaRepository get sistemaRepository {
    switch (_flavor) {
      case Flavor.DEV:
        return new DevSistemaRepository();
      default:
        return new ProdSistemaRepository();
    }
  }

  UsuarioRepository get usuarioRepository {
    switch (_flavor) {
      case Flavor.DEV:
        return new DevUsuarioRepository();
      default:
        return new ProdUsuarioRepository();
    }
  }

  ParceriaRepository get parceriaRepository {
    switch (_flavor) {
      case Flavor.DEV:
        return new DevParceriaRepository();
      default:
        return new ProdParceriaRepository();
    }
  }

  InicioRepository get inicioRepository {
    switch (_flavor) {
      case Flavor.DEV:
        return new DevInicioRepository();
      default:
        return new ProdInicioRepository();
    }
  }
}