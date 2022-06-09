import 'package:get_it/get_it.dart';
import 'package:localstorage/localstorage.dart';
import 'package:rick_and_morty_app/data/api/clients/characters.dart';
import 'package:rick_and_morty_app/data/models/info_results_response.dart';
import 'package:rick_and_morty_app/data/repositories/base.dart';
import 'package:rick_and_morty_app/data/models/character.dart';
import 'package:rick_and_morty_app/data/repositories/repositories.dart';

abstract class CharactersRepository extends BaseRepository {
  late CharactersClient _client;

  CharactersClient get client => _client;

  CharactersRepository({CharactersClient? client, LocalStorage? storage})
      : super(storage: storage) {
    if (client != null) {
      _client = client;
    } else {
      _client = GetIt.I<CharactersClient>();
    }
  }

  Future<InfoResults<Character>> getCharacters({
    String? params,
    Map<String, String>? filter,
  });
}
