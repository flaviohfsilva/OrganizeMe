import 'package:organizeme/data/models/tarefas_model.dart';

class HabitsModel {
  late final int id;
  late final String nome;
  late final String corHabito;
  late final String titulo;
  late final String subTitulo;
  late final String descricao;
  late final String img;
  late final String thumbImg;
  late final DateTime dataHora;
  late final bool ativo;
  late final List<TarefasModel> tarefas;

  HabitsModel({
    required this.id,
    required this.nome,
    required this.titulo,
    required this.subTitulo,
    required this.descricao,
    required this.img,
    required this.thumbImg,
    required this.dataHora,
    required this.ativo,
    required this.tarefas,
    required this.corHabito
  });

  factory HabitsModel.fromMap(Map<String, dynamic> map ) {
    return HabitsModel(
        id: map['id'],
        nome: map['nome'],
        corHabito: map['corHabito'],
        titulo: map['titulo'],
        subTitulo: map['subTitulo'],
        descricao: map['descricao'],
        img: map['img'],
        thumbImg: map['thumbImg'],
        dataHora: DateTime.parse(map['dataHora']),
        ativo: map['ativo'] == 1,
        tarefas: (map['tarefas'] as List<dynamic>? ?? [])
          .map((item) => TarefasModel.fromMap(item))
          .toList(),
    );
  }

}