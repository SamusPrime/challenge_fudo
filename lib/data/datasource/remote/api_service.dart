import 'dart:convert';

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

  Future<http.Response> apiPost({
    required Map<String?, dynamic>? json,
    required String endpoint,
  }) async {
    Uri uri;
    uri = Uri.parse(
      '${Services.baseUrl}$endpoint',
    );
    var body = jsonEncode(json);
    var response = await _client.post(
      uri,
      body: body,
      headers: Services.apiHeader,
    );

    return response;
  }
}
