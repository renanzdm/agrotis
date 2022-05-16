import 'package:dio/dio.dart';

class AuthInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] =
        'Client-ID UlMjPf4J0GaJq8r-JUPoqzeJWApOYWu4BHCvd8gOg0c';
    handler.next(options);
  }
}
