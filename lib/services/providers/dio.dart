import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:aflami/constants/api.dart';
import 'package:aflami/services/dio_helpers.dart';

final dioProvider = Provider<Dio>((ref) {
  var dio = Dio(
    BaseOptions(
      baseUrl: Api.baseUrl,
      queryParameters: {
        "api_key": Api.apiKey,
      },
      receiveTimeout: 50000, // 15 seconds
      connectTimeout: 50000,
      sendTimeout: 50000,
    ),
  );

  dio.interceptors.addAll({
    AppInterceptors(dio),
  });

  return dio;
});
