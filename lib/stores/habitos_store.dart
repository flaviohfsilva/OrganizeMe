import 'package:flutter/cupertino.dart';

import 'package:organizeme/data/http/exceptions.dart';
import 'package:organizeme/data/models/habits_model.dart';
import 'package:organizeme/data/repositories/habits_repository.dart';

class HabitosStore with ChangeNotifier {

  late final IHabitsRepository repository;

  // Variável reativa para o loading
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  // Variável reativa para o state
  final ValueNotifier<List<HabitsModel>> habitoState = ValueNotifier<List<HabitsModel>>([]);

  // Variável reativa para o erro
  final ValueNotifier<String> erro = ValueNotifier<String>("");

  HabitosStore({required this.repository});


  Future getHabitos() async {
    isLoading.value = true;

    try {
      final result = await repository.getHabitos();
      habitoState.value = result;
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (error) {
      erro.value = error.toString();
    }
    isLoading.value = false;
  }

  Future addHabitTasksToRoutine(int idHabito) async {
    isLoading.value = true;
    try {
      final result = await repository.addHabitTasksToRoutine(idHabito);
      habitoState.value = result;
    } on NotFoundException catch(e) {
      erro.value = e.message;
    } catch (error) {
      erro.value = error.toString();
    }

  }
}
