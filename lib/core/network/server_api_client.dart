import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:practicas_flutter/core/network/exceptions.dart';
import 'package:practicas_flutter/core/network/server_api_client_constant.dart';

const protocol = 'https';

class ServerApiClient {
  Future<http.Response> get({
    required String url,
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
  }) async {
    final Uri urlPathComplete = Uri(
      host: ServerApiClientConstant.baseUrl,
      path: url,
      scheme: protocol,
      queryParameters: queryParams,
    );
    http.Response response;
    try {
      response = await http.get(urlPathComplete, headers: headers);
      log(_formatResponseLog(response));
    } catch (e) {
      log(e.toString());
      rethrow;
    }
    return _proccessResponse<http.Response>(
      response: response,
      requestFunc: () => get(
        url: url,
        queryParams: queryParams,
        headers: headers,
      ),
    );
  }

  Future<T> _proccessResponse<T>({
    required http.Response response,
    required Future<T> Function() requestFunc,
  }) async {
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      return response as T;
    } else if (response.statusCode >= 400 || response.statusCode >= 500) {
      log(response.body);
      throw ServerException(message: response.toString());
    } else {
      return response as T;
    }
  }

  String _formatResponseLog(http.Response response, {Object? requestBody}) {
    final time = DateTime.now().toUtc().toIso8601String();

    JsonEncoder encoder = const JsonEncoder.withIndent(' ');
    String formattedRequestBody =
        requestBody != null ? encoder.convert(requestBody) : '';

    String formattedBodyJson;

    try {
      final json = jsonDecode(response.body);
      formattedBodyJson = encoder.convert(json);
    } catch (_) {
      formattedBodyJson = response.body;
    }

    return '''
          $time
          Request: ${response.request}${formattedRequestBody.isNotEmpty == true ? '\n  Request body: $formattedRequestBody' : ''}
          Response code: ${response.statusCode}
          Body: $formattedBodyJson
          ''';
  }
}
