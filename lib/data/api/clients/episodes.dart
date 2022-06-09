import 'package:retrofit/retrofit.dart';
import 'package:rick_and_morty_app/core/statics/url.dart';
import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/data/models/episode.dart';
import 'package:rick_and_morty_app/data/models/info_results_response.dart';

part 'episodes.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class EpisodesClient {
  factory EpisodesClient(Dio dio, {String baseUrl}) = _EpisodesClient;

  @GET("/episode/?{params}")
  Future<InfoResults<Episode>> getEpisodes({
    @Path("params") String? params,
  });
}
