import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:dio/dio.dart';

import 'package:kitchen_sync/utils/logger.dart';

import 'package:kitchen_sync/ui/core/utils/error_manager.dart';

class AppInterceptor extends Interceptor {
  final ErrorManager errorManager;

  AppInterceptor(this.errorManager);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final currentEnvironment = dotenv.get('CURRENT_ENV');

    if (err.type != DioExceptionType.unknown &&
        err.type != DioExceptionType.cancel &&
        currentEnvironment != 'prod') {
      Log.e("Erreur survenue lors de la requête", err, err.stackTrace);
      errorManager.setError(
        err.response?.data['message'] ??
            'Erreur réseau `${err.requestOptions.path}`',
      );
    }

    handler.next(err);
  }
}
