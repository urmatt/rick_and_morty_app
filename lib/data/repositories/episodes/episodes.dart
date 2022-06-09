import 'package:get_it/get_it.dart';
import 'package:localstorage/localstorage.dart';
import 'package:rick_and_morty_app/data/api/clients/episodes.dart';
import 'package:rick_and_morty_app/data/models/episode.dart';
import 'package:rick_and_morty_app/data/models/models.dart';
import 'package:rick_and_morty_app/data/repositories/base.dart';
import 'package:rick_and_morty_app/data/repositories/repositories.dart';

abstract class EpisodesRepository extends BaseRepository {
  late EpisodesClient _client;

  EpisodesClient get client => _client;

  EpisodesRepository({EpisodesClient? client, LocalStorage? storage})
      : super(storage: storage) {
    if (client != null) {
      _client = client;
    } else {
      _client = GetIt.I<EpisodesClient>();
    }
  }

  Future<InfoResults<Episode>> getEpisodes({String? params});
}
