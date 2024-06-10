import 'package:flutter/cupertino.dart';
import 'package:organizeme/data/models/status_model.dart';
import 'package:organizeme/data/models/tarefas_model.dart';
import 'package:organizeme/data/http/exceptions.dart';
import 'package:organizeme/data/repositories/status_repository.dart';
import 'package:organizeme/data/repositories/tarefas_repository.dart';

class StatusStore with ChangeNotifier {

  late final IStatusRepository repository;

  // Variável reativa para o loading
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  // Variável reativa para o state
  final ValueNotifier<List<StatusModel>> statusState = ValueNotifier<List<StatusModel>>([]);

  // Variável reativa para o erro
  final ValueNotifier<String> erro = ValueNotifier<String>("");

  StatusStore({required this.repository});


  Future getStatus() async {
    isLoading.value = true;

    try {
      final result = await repository.getStatus();
      statusState.value = result;
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (error) {
      erro.value = error.toString();
    }
    isLoading.value = false;
  }
}
