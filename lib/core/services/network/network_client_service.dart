import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:e_buy/core/services/logger/logger_service.dart';
part 'network_response.dart';

class NetworkClientService {
  final String _defaultErrorMessage = 'Something went wrong';
  final VoidCallback? onUnauthorized;
  final Map<String, String> commonHeaders;

  NetworkClientService({
    this.onUnauthorized,
    this.commonHeaders = const {'Content-Type': 'application/json'},
  });

  Future<NetworkResponse> get(String url) async {
    Uri uri = Uri.parse(url);
    LoggerService.preRequestLog(url);

    try {
      final response = await http.get(uri, headers: _headers);
      LoggerService.postRequestLog(
        url,
        response.statusCode,
        responseBody: response,
      );
      return _handleResponse(response);
    } catch (e) {
      return _handleException(e);
    }
  }

  Future<NetworkResponse> post(String url, Map<String, dynamic> body) async {
    Uri uri = Uri.parse(url);
    LoggerService.preRequestLog(url, body: body);

    try {
      final response = await http.post(
        uri,
        headers: _headers,
        body: jsonEncode(body),
      );

      LoggerService.postRequestLog(
        url,
        response.statusCode,
        responseBody: response,
      );
      return _handleResponse(response);
    } catch (e) {
      return _handleException(e);
    }
  }

  Future<NetworkResponse> put(String url, Map<String, dynamic> body) async {
    Uri uri = Uri.parse(url);
    LoggerService.preRequestLog(url, body: body);

    try {
      final response = await http.put(
        uri,
        headers: _headers,
        body: jsonEncode(body),
      );
      LoggerService.postRequestLog(
        url,
        response.statusCode,
        responseBody: response,
      );
      return _handleResponse(response);
    } catch (e) {
      return _handleException(e);
    }
  }

  Future<NetworkResponse> patch(String url, Map<String, dynamic> body) async {
    Uri uri = Uri.parse(url);
    LoggerService.preRequestLog(url, body: body);

    try {
      final response = await http.patch(
        uri,
        headers: _headers,
        body: jsonEncode(body),
      );
      LoggerService.postRequestLog(
        url,
        response.statusCode,
        responseBody: response,
      );
      return _handleResponse(response);
    } catch (e) {
      return _handleException(e);
    }
  }

  Future<NetworkResponse> delete(String url) async {
    Uri uri = Uri.parse(url);
    LoggerService.preRequestLog(url);

    try {
      final response = await http.delete(uri, headers: _headers);
      LoggerService.postRequestLog(
        url,
        response.statusCode,
        responseBody: response,
      );
      return _handleResponse(response);
    } catch (e) {
      return _handleException(e);
    }
  }

  Map<String, String> get _headers => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    ...commonHeaders,
  };

  NetworkResponse _handleResponse(http.Response response) {
    try {
      final decodedBody = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          data: decodedBody,
        );
      }

      if (response.statusCode == 401) {
        onUnauthorized?.call();
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: 'Unauthorized',
        );
      }

      return NetworkResponse(
        isSuccess: false,
        statusCode: response.statusCode,
        errorMessage: decodedBody['msg'] ?? _defaultErrorMessage,
      );
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: response.statusCode,
        errorMessage: 'Invalid response format',
      );
    }
  }

  NetworkResponse _handleException(Object e) {
    return NetworkResponse(
      isSuccess: false,
      errorMessage: e.toString(),
      statusCode: -1,
    );
  }
}
