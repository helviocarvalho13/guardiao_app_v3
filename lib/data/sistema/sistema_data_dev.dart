import 'dart:async';
import 'package:guardiao_app_v3/data/sistema/sistema_data.dart';

class DevSistemaRepository implements SistemaRepository{

  @override
  Future<List<Sistema>> retornaSistemas() {
    return new Future.value(sistemas);
  }
}

var sistemas = <Sistema>[
  new Sistema('00001', 'Administrativo', 'IDENTIDADE FUNCIONAL', 'Identidade Funcional', '#605ca8', '', ''),
  new Sistema('93', 'Administrativo', 'CLUBE DE PARCERIAS', 'Clube de Parcerias', '#E37224', '', ''),
  new Sistema('94', 'Administrativo', 'SD', 'Sistema de Diárias', '#126db3', '', ''),
  new Sistema('95', 'Administrativo', 'RECRUTAMENTO', 'Sistema de Recrutamento', '#333333', '', ''),
  new Sistema('96', 'Administrativo', 'PAZE', 'Sistema de Pesquisa e Satisfação TRE-MA para as Zonas', '#605ca8', '', ''),
  new Sistema('97', 'Eleitoral', 'SIOTREM-V3', 'Sistema de Orientação a Treinamentos de Mesários', '#4682B4', '', ''),
  new Sistema('98', 'Eleitoral', 'MESÁRIO VOLUNTÁRIO', 'Consulta dos Inscritos por Zona Eleitoral', '#0D9945', '', ''),
];