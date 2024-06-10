import 'dart:convert';

import 'package:organizeme/data/http/exceptions.dart';
import 'package:organizeme/data/http/http_client.dart';
import 'package:organizeme/data/models/status_model.dart';


abstract class IStatusRepository {
  Future<List<StatusModel>>getStatus();
}

class StatusRepository implements IStatusRepository {

  final IHttpClient client;

  StatusRepository({required this.client});

  @override
  Future<List<StatusModel>> getStatus() async {
    final response = await client.get(
        url: 'http://localhost:3003/status/books'
    );

    if(response.statusCode == 200){
      final List<StatusModel> status = [];

      final body = jsonDecode(response.body);

      print('Response body Status: $body');

      body.map((item) {
        final StatusModel stats =  StatusModel.fromMap(item);
        status.add(stats);
      }).toList();
      return status;
    } else if( response.statusCode == 404){
      throw NotFoundException(message: 'URL inválida!');
    } else {
      throw Exception('Erro ao realizar busca!');
    }
  }


}