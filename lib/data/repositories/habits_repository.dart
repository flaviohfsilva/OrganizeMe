import 'dart:convert';

import 'package:organizeme/data/models/habits_model.dart';
import 'package:organizeme/data/models/tarefas_model.dart';

import '../http/exceptions.dart';
import '../http/http_client.dart';

abstract class IHabitsRepository{
  Future<List<HabitsModel>>getHabitos();
  Future<List<HabitsModel>>addHabitTasksToRoutine(int idHabito);
}

class HabitsRepository implements IHabitsRepository {

  final IHttpClient client;

  HabitsRepository({required this.client});

  @override
  Future<List<HabitsModel>> getHabitos() async {
    final response = await client.get(
        url: 'http://192.168.0.110:3003/habitos/task'
    );

    if(response.statusCode == 200) {
      final List<HabitsModel> habitos = [];

      final body = jsonDecode(response.body);

      print('Response body Habits: $body');

      body.map((item) {
      final HabitsModel habits =  HabitsModel.fromMap(item);
      habitos.add(habits);
      }).toList();
      return habitos;
    } else if ( response.statusCode == 404) {
      throw NotFoundException(message: 'URL inválida!');
    } else {
      throw Exception('Erro ao realizar busca!');
    }
  }

  @override
  Future<List<HabitsModel>> addHabitTasksToRoutine(int idHabito) async {
    final response = await client.get(
        url: 'http://192.168.0.110:3003/tarefas/AdicionarTaskNaRotina/${idHabito}'
    );

    if(response.statusCode == 200) {
      final List<HabitsModel> habitos = [];

      final body = jsonDecode(response.body);

      print('Response body Habits: $body');

      body.map((item) {
        final HabitsModel habits =  HabitsModel.fromMap(item);
        habitos.add(habits);
      }).toList();
      return habitos;
    } else if ( response.statusCode == 404) {
      throw NotFoundException(message: 'URL inválida!');
    } else {
      throw Exception('Erro ao realizar busca!');
    }

  }


}