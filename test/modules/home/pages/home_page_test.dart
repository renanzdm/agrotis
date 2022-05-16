import 'package:agrotis/core/controller/theme_store.dart';
import 'package:agrotis/modules/home/models/image_model.dart';
import 'package:agrotis/modules/home/pages/controller/home_store.dart';
import 'package:agrotis/modules/home/pages/home_page.dart';
import 'package:agrotis/modules/home/pages/widgets/drawer_widget.dart';
import 'package:agrotis/modules/home/repositories/get_photo_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:provider/provider.dart';

class GetPhotoRepositoryMock extends Mock implements GetPhotoRepository {}

class ImageModelMock extends Mock implements ImageModel {}

void main() {
  late final GetPhotoRepositoryMock getRepositoryMock;
  late final HomeStore homeStore;
  setUpAll(() {
    getRepositoryMock = GetPhotoRepositoryMock();
    homeStore = HomeStore(getPhotoRepository: getRepositoryMock);
  });

  group('testes drawer opened on button', () {
    testWidgets('testes open drawer ...', (tester) async {
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
      final settings = find.byIcon(Icons.settings);
      await tester.tap(settings);
      await tester.pump();
      final drawer = find.byType(Drawer);
      expect(drawer, findsOneWidget);

      final closeButton = find.byIcon(Icons.close);
      expect(closeButton, findsOneWidget);
    });
  });

  group('testes options drawer', () {
    testWidgets('tests buttons drawer ...', (tester) async {
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
          ], child: const DrawerWidget()),
        ),
      );
      final layout = find.byKey(const ValueKey('layout'));
      final theme = find.byKey(const ValueKey('theme'));
      expect(layout, findsOneWidget);
      expect(theme, findsOneWidget);

      await tester.tap(layout);
      await tester.pump();
      await tester.tap(theme);
      await tester.pump();
    });
  });

  group('testes images home page', () {
    testWidgets('tests images ...', (tester) async {
      Widget photoWidget() => MaterialApp(
              home: Provider(
            create: (context) => ThemeStore(),
            child: PhotoWidget(model: ImageModel()),
          ));
      await mockNetworkImagesFor(() => tester.pumpWidget(photoWidget()));

      final gesture = find.byKey(const ValueKey('gesture'));
      expect(gesture, findsOneWidget);

      await tester.tap(gesture);
      await tester.pump();

      final largeImageDialog = find.byKey(const ValueKey('largeImage'));
      expect(largeImageDialog, findsOneWidget);
    });
  });
}
