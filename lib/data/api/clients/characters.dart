import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/core/statics/url.dart';
import 'package:rick_and_morty_app/data/models/character.dart';
import 'package:rick_and_morty_app/data/models/info_results_response.dart';

part 'characters.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class CharactersClient {
  factory CharactersClient(Dio dio, {String baseUrl}) = _CharactersClient;

  @GET("/character/?{params}")
  Future<InfoResults<Character>> getCharacters({
    @Path("params") String? params,
  });
}
