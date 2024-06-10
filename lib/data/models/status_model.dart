import 'library_model.dart';

class StatusModel {
  late final int id;
  late final String nome;
  late final bool ativo;
  late final List<LibraryModel> livros;

  StatusModel({
    required this.id,
    required this.nome,
    required this.ativo,
    required this.livros
  });


  factory StatusModel.fromMap(Map<String, dynamic> map ) {
    return StatusModel(
    id: map['id'],
    nome: map['nome'],
    ativo: map['ativo'] == 1,
    livros: (map['livros'] as List<dynamic>? ?? [])
        .map((item) => LibraryModel.fromMap(item))
        .toList(),
  );
}

}