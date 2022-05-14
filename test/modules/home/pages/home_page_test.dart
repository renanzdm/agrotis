import 'package:agrotis/core/controller/theme_store.dart';
import 'package:agrotis/modules/home/models/image_model.dart';
import 'package:agrotis/modules/home/pages/controller/home_store.dart';
import 'package:agrotis/modules/home/pages/home_page.dart';
import 'package:agrotis/modules/home/repositories/get_photo_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

class GetPhotoRepositoryMock extends Mock implements GetPhotoRepository {}

void main() {
  late final GetPhotoRepositoryMock getRepositoryMock;
  late final HomeStore homeStore;
  setUpAll(() {
    getRepositoryMock = GetPhotoRepositoryMock();
    homeStore = HomeStore(getPhotoRepository: getRepositoryMock);
  });
  testWidgets(
    'home page ...',
    (tester) async {
      when(
        () => getRepositoryMock.call(),
      ).thenAnswer((invocation) => Future.value(const Right(<ImageModel>[])));

      await tester.pumpWidget(
        MaterialApp(
          home: MultiProvider(providers: [
            Provider(
              create: (context) => ThemeStore(),
            ),
            Provider(
              create: (context) => homeStore,
            )
          ], child: const HomePageContent()),
        ),
      );
    },
  );
}
