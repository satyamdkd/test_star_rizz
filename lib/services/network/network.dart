import 'dart:convert';
import 'dart:io';
import 'package:demo_firebase/services/network/api_result.dart';
import 'package:dio/dio.dart' as network;
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Network {
  final network.Dio _dio;
  static const String _baseUrl = "https://snaptask.supermargins.com/api/auth";
  final String? token;
  Network({this.token})
      : _dio = network.Dio()
          ..options = network.BaseOptions(
            baseUrl: _baseUrl,
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token',
            },
          )
          ..interceptors.addAll([
            PrettyDioLogger(
              requestHeader: true,
              requestBody: true,
              responseBody: true,
            ),
            network.InterceptorsWrapper(
              onRequest: (options, handler) => handler.next(options),
            ),
          ]);

  getData({
    Map<String, dynamic>? queryParameters,
    required String endPoint,
  }) async {
    if (kDebugMode) {
      debugPrint(token);
    }

    try {
      final response = await _dio.get(
        _baseUrl + endPoint,
        queryParameters: queryParameters,
      );
      return _returnResponse(response);
    } on SocketException {
      return ApiFailure('Socket Exception');
    } on FormatException {
      return ApiFailure('Format Exception');
    } on network.DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      return ApiFailure('Unexpected Error');
    }
  }

  Future<ApiResults> postData({
    dynamic data,
    required String endPoint,
  }) async {
    try {
      final response = await _dio.post(
        endPoint,
        data: network.FormData.fromMap(data ?? {}),
      );
      return _returnResponse(response);
    } on SocketException {
      return ApiFailure('Socket Exception');
    } on FormatException {
      return ApiFailure('Format Exception');
    } on network.DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      return ApiFailure('Unexpected Error');
    }
  }

  postDataWithFilesNew({
    Map<String, dynamic>? data,
    required String endPoint,
    required network.FormData formData,
  }) async {
    try {
      final response = await _dio.post(
        _baseUrl + endPoint,
        queryParameters: data,
        data: formData,
      );

      return _returnResponse(response);
    } on SocketException {
      return ApiFailure('Socket Exception');
    } on FormatException {
      return ApiFailure('Format Exception');
    } on network.DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      return ApiFailure('Unexpected Error');
    }
  }

  ApiResults _returnResponse(network.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        debugPrint(response.toString());

        debugPrint(response.data.runtimeType.toString());

        if (response.data is String) {
          return ApiSuccess(
            json.decode(response.data),
            response.statusCode,
          );
        } else if (response.data is Map<String, dynamic> ||
            response.data is List) {
          return ApiSuccess(
            response.data,
            response.statusCode,
          );
        } else {
          return ApiFailure(
              title: 'Unexpected Response Data.',
              response.data
                  .toString()
                  .replaceAll("{", "")
                  .replaceAll("}", "")
                  .replaceAll(":", "")
                  .replaceAll("[", "")
                  .replaceAll("]", "")
                  .replaceAll("error", "")
                  .trim());
        }
      case 400:
        throw ApiFailure(
            title: "Bad request.",
            response.data
                .toString()
                .replaceAll("{", "")
                .replaceAll("}", "")
                .replaceAll(":", "")
                .replaceAll("[", "")
                .replaceAll("]", "")
                .replaceAll("error", "")
                .trim());
      case 401:
        throw ApiFailure(
            title: "Incorrect credentials.",
            response.data
                .toString()
                .replaceAll("{", "")
                .replaceAll("}", "")
                .replaceAll(":", "")
                .replaceAll("[", "")
                .replaceAll("]", "")
                .replaceAll("error", "")
                .trim());
      case 403:
        throw ApiFailure(
            title: "Token error.",
            response.data
                .toString()
                .replaceAll("{", "")
                .replaceAll("}", "")
                .replaceAll(":", "")
                .replaceAll("[", "")
                .replaceAll("]", "")
                .replaceAll("error", "")
                .trim());
      case 404:
        throw ApiFailure("Resource not found.");
      case 500:
        throw ApiFailure("Internal server error.");
      default:
        throw ApiFailure(
          'Error occurred while communicating with server. StatusCode: ${response.statusCode}.',
        );
    }
  }

  ApiResults _handleDioError(network.DioException e) {
    if (e.response != null) {
      return _returnResponse(e.response!);
    } else {
      switch (e.type) {
        case network.DioExceptionType.connectionTimeout:
          return ApiFailure('Connection Timeout');
        case network.DioExceptionType.receiveTimeout:
          return ApiFailure('Receive Timeout');
        case network.DioExceptionType.connectionError:
          return ApiFailure('No Internet');
        default:
          return ApiFailure('Unknown Error: ${e.message}');
      }
    }
  }
}
