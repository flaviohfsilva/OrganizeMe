import 'dart:convert';

import 'package:organizeme/data/http/exceptions.dart';
import 'package:organizeme/data/http/http_client.dart';
import 'package:organizeme/data/models/library_model.dart';

abstract class ILibraryRepository {
  Future<List<LibraryModel>> getLivros();
  Future<List<LibraryModel>> searchLivros(String livro);
}

class LibraryRepository implements ILibraryRepository {
  final IHttpClient client;

  LibraryRepository({required this.client});

  @override
  Future<List<LibraryModel>> getLivros() async {
    final response = await client.get(
      url: 'http://localhost:3003/biblioteca/booksByStatus',
    );

    if (response.statusCode == 200) {
      final List<LibraryModel> livros = [];
      final body = jsonDecode(response.body) as List;

      print('Response body Library: $body');

      livros.addAll(body.map((item) => LibraryModel.fromMap(item)).toList());
      return livros;
    } else if (response.statusCode == 404) {
      throw NotFoundException(message: 'URL inválida!');
    } else {
      throw Exception('Erro ao realizar busca!');
    }
  }

  @override
  Future<List<LibraryModel>> searchLivros(String livro) async {
    final response = await client.get(
      url: 'http://localhost:3003/biblioteca/buscarLivro/$livro',
    );

    if (response.statusCode == 200) {
      final List<LibraryModel> livros = [];
      final body = jsonDecode(response.body);

      print('Response body Library: $body');

      body.map((item) {
        final LibraryModel book =  LibraryModel.fromMap(item);
        livros.add(book);
      }).toList();;
      print('Livros ${livros}');
      return livros;
    } else if (response.statusCode == 404) {
      throw NotFoundException(message: 'URL inválida!');
    } else {
      throw Exception('Erro ao realizar busca!');
    }
  }
}
