import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

enum HttpMethod { postMethod, getMethod }

class NetworkService {
  var client = http.Client();

  Future<dynamic> request(String url,
      {required HttpMethod method, Map? body}) async {
    var response;
    final uri = Uri.parse('http://$url');

    try {
      switch (method) {
        case HttpMethod.getMethod:
          response = await client.get(uri);
          break;

        case HttpMethod.postMethod:
          response = await client.post(uri, body: body);
          break;
      }
      log('--------- RESPONSE: \n${response.body}');

      var decodedResponse = jsonDecode(response.body) as Map;
      return decodedResponse;
    } catch (e) {
      rethrow;
    } finally {
      client.close();
    }
  }
}
