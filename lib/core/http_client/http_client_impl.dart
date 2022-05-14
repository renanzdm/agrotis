import 'package:agrotis/core/http_client/auth_interceptors.dart';
import 'package:agrotis/core/http_client/http_client.dart';
import 'package:dio/dio.dart';

class HttpClientImpl implements HttpClient {
  final Dio _dio;
  static final _baseOptions = BaseOptions(
    baseUrl: 'https://api.unsplash.com',
    receiveTimeout: 15000,
    connectTimeout: 15000,
  );
  HttpClientImpl()
      : _dio = Dio(_baseOptions)
          ..interceptors.addAll([AuthInterceptors(), LogInterceptor()]);

  @override
  Future<Response<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) async {
    return await _dio.get<T>(path,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: options,
        queryParameters: queryParameters);
  }
}
