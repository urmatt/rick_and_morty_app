import 'package:get_it/get_it.dart';
import 'package:localstorage/localstorage.dart';

class BaseRepository {
  LocalStorage? _storage;

  LocalStorage? get storage => _storage;

  BaseRepository({LocalStorage? storage}) {
    if (storage != null) {
      _storage = storage;
    } else {
      _storage = GetIt.I<LocalStorage>();
    }
  }
}
