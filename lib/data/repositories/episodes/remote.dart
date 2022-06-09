import 'package:rick_and_morty_app/data/models/episode.dart';
import '../../models/info_results_response.dart';
import 'episodes.dart';

class EpisodesRemoteRepo extends EpisodesRepository {
  @override
  Future<InfoResults<Episode>> getEpisodes({String? params}) async {
    var result = await client.getEpisodes(params: params);
    storage?.setItem('episode/?$params', result.toJson());
    return result;
  }
}
