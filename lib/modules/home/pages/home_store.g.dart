// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller/home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$imageModelAtom = Atom(name: 'HomeStoreBase.imageModel');

  @override
  ObservableList<ImageModel> get images {
    _$imageModelAtom.reportRead();
    return super.images;
  }

  @override
  set images(ObservableList<ImageModel> value) {
    _$imageModelAtom.reportWrite(value, super.images, () {
      super.images = value;
    });
  }

  final _$errorMessageAtom = Atom(name: 'HomeStoreBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$loadingAtom = Atom(name: 'HomeStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$getPhotosAsyncAction = AsyncAction('HomeStoreBase.getPhotos');

  @override
  Future<void> getPhotos() {
    return _$getPhotosAsyncAction.run(() => super.getPhotos());
  }

  @override
  String toString() {
    return '''
imageModel: ${images},
errorMessage: ${errorMessage},
loading: ${loading}
    ''';
  }
}
