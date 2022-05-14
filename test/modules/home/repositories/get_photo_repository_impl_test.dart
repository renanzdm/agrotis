import 'package:agrotis/core/errors/failures.dart';
import 'package:agrotis/core/http_client/http_client.dart';
import 'package:agrotis/modules/home/errors/home_errors.dart';
import 'package:agrotis/modules/home/models/image_model.dart';
import 'package:agrotis/modules/home/repositories/get_photo_repository.dart';
import 'package:agrotis/modules/home/repositories/get_photo_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../response.dart';

class HttpClientMock extends Mock implements HttpClient {}

class ResponseMock extends Mock implements Response {
  @override
  final dynamic data;
  ResponseMock({required this.data});
}

class DioErrorMock extends Mock implements DioError {
  @override
  final DioErrorType type;
  @override
  final dynamic error;
  @override
  String get message => (error?.toString() ?? '');
  DioErrorMock({required this.type, required this.error});
}

void main() {
  late final GetPhotoRepository getPhotoRepository;
  late final HttpClientMock httpClient;
  setUpAll(() {
    httpClient = HttpClientMock();
    getPhotoRepository = GetPhotoRepositoryImpl(httpClient: httpClient);
  });

  test('get photo repository impl with success ...', () async {
    when(() => httpClient.get(any()))
        .thenAnswer((invocation) => Future.value(ResponseMock(data: response)));
    var result = await getPhotoRepository();
    expect(result, isA<Right>());
    expect(result.fold((l) => l, (r) => r), isA<List<ImageModel>>());
  });

  test('get photo repository impl with error connect ...', () async {
    when(() => httpClient.get(any())).thenThrow(DioErrorMock(
        type: DioErrorType.connectTimeout, error: 'Error in connect'));
    var result = await getPhotoRepository();
    expect(result, isA<Left>());
    expect(result.fold((l) => l, (r) => r), isA<NoConnetionError>());
  });
  test('get photo repository impl with other error ...', () async {
    when(() => httpClient.get(any())).thenThrow(
        DioErrorMock(type: DioErrorType.other, error: 'Other error'));
    var result = await getPhotoRepository();
    expect(result, isA<Left>());
    expect(result.fold((l) => l, (r) => r), isA<UnknownError>());
  });

  test('get photo repository impl with other error ...', () async {
    when(() => httpClient.get(any())).thenThrow(
        DioErrorMock(type: DioErrorType.cancel, error: 'Cancel error'));
    expect(() => getPhotoRepository(), throwsA(isA<UnknownError>()));
  });
}
