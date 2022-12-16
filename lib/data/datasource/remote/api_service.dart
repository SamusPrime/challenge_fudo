import 'package:http/http.dart' as http;

import '../../../core/util/services.dart';

class ApiService {
  final http.Client _client;

  ApiService({
    http.Client? client,
  }) : _client = client ?? http.Client();

  Future<http.Response> apiCall({required String endpoint}) async {
    Uri uri;
    uri = Uri.parse(
      '${Services.baseUrl}$endpoint',
    );
    var response = await _client.get(
      uri,
    );
    return response;
  }
}
