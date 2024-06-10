import 'package:http/http.dart' as httpService;

abstract class IHttpClient {
  get({required String url});
  Future post({required String url, required Map<String, String> headers, required String body});
  Future patch({required String url, required Map<String, String> headers, required String body});
  Future delete({required String url, required Map<String, String> headers});
}

class HttpClient implements IHttpClient {

  final client = httpService.Client();

  @override
  Future get({required String url}) async {
   return await client.get(Uri.parse(url));
  }

  @override
   post({required String url, required Map<String, String> headers, required String body})  {
    return  client.post(Uri.parse(url), body: body);
  }

  @override
  Future patch({required String url, required Map<String, String> headers, required String body}) async {
    return await client.patch(Uri.parse(url), headers: headers, body: body);
  }

  @override
  Future delete({required String url, required Map<String, String> headers}) async {
    return await client.delete(Uri.parse(url), headers: headers);
  }
  
}