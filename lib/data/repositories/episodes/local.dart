import 'package:rick_and_morty_app/data/models/models.dart';
import 'episodes.dart';

class EpisodesLocalRepo extends EpisodesRepository {
  @override
  Future<InfoResults<Episode>> getEpisodes({String? params}) async {
    var localEpisodesInfo = storage?.getItem('episode/?$params');
    if (localEpisodesInfo != null) {
      return InfoResults<Episode>.fromJson(localEpisodesInfo);
    }
    return InfoResults(info: Info(), results: []);
  }
}
