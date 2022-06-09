import 'package:rick_and_morty_app/data/models/models.dart';

import 'characters.dart';

class CharactersLocalRepo extends CharactersRepository {
  @override
  Future<InfoResults<Character>> getCharacters({
    String? params,
    Map<String, String>? filter,
  }) async {
    var localCharactersInfo = storage?.getItem('characters/?$params');
    if (localCharactersInfo != null) {
      return InfoResults<Character>.fromJson(localCharactersInfo);
    }
    return InfoResults(info: Info(), results: []);
  }
}
