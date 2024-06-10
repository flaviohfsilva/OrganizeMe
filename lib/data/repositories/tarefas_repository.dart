import 'dart:convert';

import 'package:organizeme/data/http/exceptions.dart';
import 'package:organizeme/data/http/http_client.dart';
import 'package:organizeme/data/models/tarefas_model.dart';

abstract class ITarefasRepository {
  Future<List<TarefasModel>>getTarefas();
  Future<TarefasModel> getTarefaById(String id);
  Future<TarefasModel> createTarefa(Map<String, dynamic> tarefa);
  Future<TarefasModel> updateTarefa(int id, TarefasModel tarefa);
  Future<TarefasModel> deleteTarefa(int id);


}

class TarefasRepository implements ITarefasRepository {

  final IHttpClient client;

  TarefasRepository({required this.client});

  @override
  Future<List<TarefasModel>> getTarefas() async {
    final response = await client.get(
        url: 'http://192.168.0.110:3003/tarefas'
    );

    if(response.statusCode == 200){
      final List<TarefasModel> tarefas = [];

      final body = jsonDecode(response.body);

      body.map((item) {
        final TarefasModel task =  TarefasModel.fromMap(item);
        tarefas.add(task);
      }).toList();
      return tarefas;
    } else if( response.statusCode == 404){
      throw NotFoundException(message: 'URL inválida!');
    } else {
      throw Exception('Erro ao realizar busca!');
    }
  }

  @override
  Future<TarefasModel> createTarefa(Map<String, dynamic> tarefa) async {
    final url = 'http://192.168.0.110:3003/tarefas/create';
    final body = jsonEncode(tarefa);
    final headers = {'Content-Type': 'application/json'};

    print("BOdy> ${body}");



    final response = await client.post(url: url, headers: headers, body: body);

    if (response.statusCode == 201) {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);
      print("REsponseBOdy> ${responseBody}");
      return TarefasModel.fromMap(responseBody);
    } else {
      throw Exception('Erro ao criar tarefa: ${response.reasonPhrase}');
    }
  }

  @override
  Future<TarefasModel> deleteTarefa(int id) async {
    final response = await client.delete(
        url: 'http://192.168.0.110:3003/tarefas/delete/$id',
        headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return TarefasModel.fromMap(body);
    } else {
      throw Exception('Erro ao atualizar tarefa!');
    }
  }

  @override
  Future<TarefasModel> getTarefaById(String id) async {
    final response = await client.get(
      url: 'http://localhost:3003/tarefas/$id'
    );

    if(response.statusCode == 200) {
      final body = jsonDecode(response.body);

      print('Tarefa por id: $body');

      return TarefasModel.fromMap(body);
    } else if (response.statusCode == 404) {
      throw NotFoundException(message: 'Tarefa não encontrada!');
    } else {
      throw Exception('Erro ao buscar tarefa!');
    }
  }

  @override
  Future<TarefasModel> updateTarefa(int id, TarefasModel tarefa) async {
    
    final response = await client.patch(
        url: 'http://192.168.0.110:3003/tarefas/update/$id',
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(tarefa)
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return TarefasModel.fromMap(body);
    } else {
      throw Exception('Erro ao atualizar tarefa!');
    }
  }


}