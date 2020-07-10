import 'dart:async';
import 'package:guardiao_app_v3/data/parceria/parceria_data.dart';

class DevParceriaRepository implements ParceriaRepository{
  @override
  Future<List<Parceria>> retornaParcerias() {
    parcerias.sort(
            (a, b){
          return a.nome.toLowerCase().compareTo(b.nome.toLowerCase());
        });
    return new Future.value(parcerias);
  }

  var parcerias = <Parceria> [
    new Parceria('224', 'ACADEMIA BODYTECH', 'ACADEMIAS', 'SAÚDE', '', '0% em qualquer plano e 50% na taxa de adesão',
        'Av. Daniel de La Touche, N°987 , loja 118, Shopping da Ilha',
        'COHAMA', '01 ano', '', '', '', 'https://www.facebook.com/Bodytech', 'https://www.instagram.com/bt_shoppingdailha',
        'leandro.braga@bodytech.com.br', 'https://goo.gl/maps/yTXoaa9FSTJ2', 'www.bodytech.com.br', '', '(98) 3256-0030', ''),
    new Parceria('225', 'ALEXIA FLORES', 'FLORICULTURA', 'FLORICULTURA', '', '5% na tabela de atacado que inclui floricultura e decorador e 10% nos produtos prontos e acabados da floricultura e da lojinha',
        'Av. Daniel de La Touche, N°987 , loja 118, Shopping da Ilha',
        'COHAMA', '01 ano', '', '', 'http://www.faap.br/pdf/faculdades/direito/MANUAL%20TRABALHO%20DE%20CONCLUS%C3%83O%20DE%20CURSO%202012%20-%20MODELO%20PROJETO%20E%20%20NORMAS%20DO%20TCC%20%20RESUMO%20E%20INTRODU%C3%87%C3%83O.pdf', 'https://www.facebook.com/alexia.garden.96', 'https://www.instagram.com/alexiafloresfortaleza',
        'alexiaflores.garden@gmail.com', 'https://goo.gl/maps/jsu2jQpf89p', 'www.alexiaflores.com.br', '(98) 98826-1792', '(98) 3236-2839', '(98) 3226-5946'),
  ];

}