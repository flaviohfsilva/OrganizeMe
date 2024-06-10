import 'package:flutter/cupertino.dart';
import 'package:organizeme/data/models/tarefas_model.dart';
import 'package:organizeme/data/http/exceptions.dart';
import 'package:organizeme/data/repositories/tarefas_repository.dart';

class TarefasStore with ChangeNotifier{

  late final ITarefasRepository repository;

  // Variável reativa para o loading
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  // Variável reativa para o state
  final ValueNotifier<List<TarefasModel>> tarefaState = ValueNotifier<List<TarefasModel>>([]);

  // Variável reativa para o erro
  final ValueNotifier<String> erro = ValueNotifier<String>("");

  TarefasStore({required this.repository});


  Future getTarefas() async {
    isLoading.value = true;

    try {
      final result = await repository.getTarefas();
      tarefaState.value = result;
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (error) {
      erro.value = error.toString();
    }
    isLoading.value = false;
  }

  Future createTarefa(Map<String, dynamic> tarefa) async {
    print(tarefa);
    isLoading.value = true;

    try {
      final result = await repository.createTarefa(tarefa);
      tarefaState.value = [...tarefaState.value, result];
    } catch (error) {
      erro.value = error.toString();
    }
    isLoading.value = false;
  }

  Future updateTarefa(int? id, TarefasModel tarefa) async {
    isLoading.value = true;

    try {
      final result = await repository.updateTarefa(id!, tarefa);
      tarefaState.value = tarefaState.value.map((t) => t.id == result.id ? result : t).toList();
    } catch (error) {
      erro.value = error.toString();
    }
    isLoading.value = false;
  }

  Future deleteTarefa(int id) async {
    isLoading.value = true;

    try {
      await repository.deleteTarefa(id);
      tarefaState.value = tarefaState.value.where((t) => t.id != id).toList();
    } catch (error) {
      erro.value = error.toString();
    }
    isLoading.value = false;
  }
}
