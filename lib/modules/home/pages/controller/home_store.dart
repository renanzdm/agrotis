import 'package:agrotis/modules/home/models/image_model.dart';
import 'package:agrotis/modules/home/repositories/get_photo_repository.dart';
import 'package:mobx/mobx.dart';

part '../home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final GetPhotoRepository _getPhotoRepository;
  HomeStoreBase({required GetPhotoRepository getPhotoRepository})
      : _getPhotoRepository = getPhotoRepository;

  @observable
  ObservableList<ImageModel> images = <ImageModel>[].asObservable();
  @observable
  String errorMessage = '';
  @observable
  bool loading = false;

  @action
  Future<void> getPhotos() async {
    loading = true;
    var response = await _getPhotoRepository();
    loading = false;
    await response.fold((l) async => errorMessage = l.errorMessage,
        (r) async => images = r.asObservable());
  }
}
