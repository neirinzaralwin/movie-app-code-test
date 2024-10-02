import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioConfig {
  final String baseUrl;
  final String token;
  static DioConfig? _instance;
  late Dio _dio;

  DioConfig._internal({required this.baseUrl, required this.token}) {
    _dio = Dio(BaseOptions(baseUrl: baseUrl, headers: {"Authorization": "Bearer $token"}));

    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: false,
          responseHeader: true,
          error: true,
          compact: true));
    }
    _dio.interceptors.add(InterceptorsWrapper(onResponse: (response, handler) {
      handler.next(response);
    }, onError: ((error, handler) async {
      handler.next(error);
    })));
  }

  factory DioConfig({required String baseUrl, required String token}) {
    return _instance ??= DioConfig._internal(baseUrl: baseUrl, token: token);
  }

  Dio get dio => _dio;
}
