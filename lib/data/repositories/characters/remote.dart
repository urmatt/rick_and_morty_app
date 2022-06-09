import 'package:rick_and_morty_app/core/extentions/map_extentions.dart';
import 'package:rick_and_morty_app/data/models/character.dart';
import 'package:rick_and_morty_app/data/models/info_results_response.dart';
import 'characters.dart';

class CharactersRemoteRepo extends CharactersRepository {
  @override
  Future<InfoResults<Character>> getCharacters({
    String? params,
    Map<String, String>? filter,
  }) async {
    var p = (params ?? '') + (filter?.toUrlParams() ?? '');

    var result = await client.getCharacters(params: p);

    await storage?.setItem('characters/?${params ?? ''}', result.toJson());
    return result;
  }
}
