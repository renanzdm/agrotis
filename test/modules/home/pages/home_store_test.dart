import 'package:agrotis/core/errors/failures.dart';
import 'package:agrotis/modules/home/models/image_model.dart';
import 'package:agrotis/modules/home/pages/controller/home_store.dart';
import 'package:agrotis/modules/home/repositories/get_photo_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class GetPhotoRepositoryMock extends Mock implements GetPhotoRepository {}

void main() {
  late final GetPhotoRepositoryMock getRepositoryMock;
  late final HomeStore homeStore;
  setUpAll(() {
    getRepositoryMock = GetPhotoRepositoryMock();
    homeStore = HomeStore(getPhotoRepository: getRepositoryMock);
  });

  test('home store with success...', () async {
    when(() => getRepositoryMock())
        .thenAnswer((invocation) => Future.value(const Right(<ImageModel>[])));

    await homeStore.getPhotos();
    expect(homeStore.images, isA<List<ImageModel>>());
  });

  test('home store with error...', () async {
    when(() => getRepositoryMock()).thenAnswer((invocation) =>
        Future.value(Left(UnknownError(errorMessage: 'Error Unknown'))));

    await homeStore.getPhotos();
    expect(homeStore.errorMessage, equals('Error Unknown'));
  });

  test('home store loading...', () async {
    when(() => getRepositoryMock())
        .thenAnswer((invocation) => Future.value(const Right(<ImageModel>[])));
    await homeStore.getPhotos();
    expect(homeStore.loading, false);
  });
}
