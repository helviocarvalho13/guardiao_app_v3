import 'package:guardiao_app_v3/data/parceria/parceria_data.dart';
import 'package:guardiao_app_v3/data/usuario/usuario_data.dart';

class ClubeParceriaDTO{
  final Usuario usuario;
  final List<Parceria> parcerias;

  ClubeParceriaDTO(this.usuario, this.parcerias);
}