import 'package:guardiao_app_v3/data/parceria/parceria_data.dart';
import 'package:guardiao_app_v3/data/usuario/usuario_data.dart';

class ExibirParceriaDTO{
  final Usuario usuario;
  final Parceria parceria;

  ExibirParceriaDTO(this.usuario, this.parceria);
}