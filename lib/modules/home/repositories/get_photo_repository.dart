import 'package:agrotis/modules/home/models/image_model.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/errors/failures.dart';

abstract class GetPhotoRepository {
  Future<Either<Failures, List<ImageModel>>> call();
}
