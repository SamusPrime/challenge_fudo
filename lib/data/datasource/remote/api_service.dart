import 'package:http/http.dart' as http;

import '../../../core/util/constants_service.dart';

class ApiService {
  final http.Client _client;

  ApiService({
    http.Client? client,
  }) : _client = client ?? http.Client();

  Future<http.Response> apiCall({endpoint}) async {
    Uri uri;
    uri = Uri.parse(
      '${ConstantsService.baseUrl}$endpoint',
    );
    var response = await _client.get(
      uri,
    );
    return response;
  }
}
