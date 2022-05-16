import 'package:agrotis/core/http_client/http_client.dart';
import 'package:agrotis/modules/home/models/image_model.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/errors/failures.dart';
import '../errors/home_errors.dart';
import 'get_photo_repository.dart';

class GetPhotoRepositoryImpl implements GetPhotoRepository {
  final HttpClient _httpClient;
  GetPhotoRepositoryImpl({required HttpClient httpClient})
      : _httpClient = httpClient;

  @override
  Future<Either<Failures, List<ImageModel>>> call() async {
    try {
      Response response = await _httpClient.get('/photos');
      List result =
          response.data.map((e) => e['user']['profile_image']).toList();
      return Right(result.map((e) => ImageModel.fromMap(e)).toList());
    } on DioError catch (e, s) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.connectTimeout) {
        return Left(NoConnetionError('Not Connection', s, s));
      } else if (e.type == DioErrorType.other) {
        return Left(
          UnknownError(error: e.error, errorMessage: e.message, stack: s),
        );
      } else {
        throw Exception(e);
      }
    }
  }
}
