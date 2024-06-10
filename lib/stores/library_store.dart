import 'package:flutter/cupertino.dart';
import 'package:organizeme/data/models/library_model.dart';
import 'package:organizeme/data/http/exceptions.dart';
import 'package:organizeme/data/repositories/library_repository.dart';


class LibraryStore with ChangeNotifier {

  late final ILibraryRepository repository;

  // Variável reativa para o loading
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  // Variável reativa para o state
  final ValueNotifier<List<LibraryModel>> livroState = ValueNotifier<List<LibraryModel>>([]);
  final ValueNotifier<List<dynamic>> searchState = ValueNotifier<List<dynamic>>([]);


  // Variável reativa para o erro
  final ValueNotifier<String> erro = ValueNotifier<String>("");

  LibraryStore({required this.repository});


  Future getLivros() async {
    isLoading.value = true;

    try {
      final result = await repository.getLivros();
      livroState.value = result;
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (error) {
      erro.value = error.toString();
    }
    isLoading.value = false;
  }

  Future searchLivros(String livro) async {
    isLoading.value = true;
    try {
      final result = await repository.searchLivros(livro);
      livroState.value = result;
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (error) {
      erro.value = error.toString();
    }
    isLoading.value = false;
  }
}
