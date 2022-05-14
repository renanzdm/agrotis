import 'package:dio/dio.dart';

class AuthInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String apiKey = const String.fromEnvironment('DEFINE_API_KEY');
    options.headers['Authorization'] = 'Client-ID $apiKey';
    handler.next(options);
  }
}
