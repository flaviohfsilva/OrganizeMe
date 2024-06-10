import 'package:organizeme/data/models/status_model.dart';

class LibraryModel {
  late final int id;
  late final String nome;
  late final String editora;
  late final String dataPublicacao;
  late final String descricao;
  late final String autor;
  late final String isbn;
  late final String img;
  late final int paginaTotal;
  late final int paginaAtual;
  late final DateTime dataHora;
  late final int idStatus;
  late final bool ativo;
  late final List<StatusModel> status;

  LibraryModel({
    required this.id,
    required this.nome,
    required this.editora,
    required this.dataPublicacao,
    required this.descricao,
    required this.autor,
    required this.isbn,
    required this.img,
    required this.paginaTotal,
    required this.paginaAtual,
    required this.dataHora,
    required this.idStatus,
    required this.ativo,
    required this.status
  });

  factory LibraryModel.fromMap(Map<String, dynamic> map) {
    return LibraryModel(
      id: map['id'],
      nome:  map['nome'],
      editora:  map['editora'],
      dataPublicacao:  map['dataPublicacao'],
      descricao:  map['descricao'],
      autor:  map['autor'],
      isbn:  map['isbn'],
      img:  map['img'],
      paginaTotal:  map['paginaTotal'],
      paginaAtual:  map['paginaAtual'],
      dataHora:  map['dataHora'],
      idStatus:  map['ativo'],
      ativo:  map['ativo'],
      status:  map['status']
    );
  }
}