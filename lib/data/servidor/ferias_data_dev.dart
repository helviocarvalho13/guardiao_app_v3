import 'dart:async';
import 'package:guardiao_app_v3/data/servidor/ferias_data.dart';

class DevFeriasRepository implements FeriasRepository {
  @override
  Future<List<Ferias>> retornaFerias() {
    return new Future.value(ferias);
  }

  var ferias = <Ferias>[

  ];
}