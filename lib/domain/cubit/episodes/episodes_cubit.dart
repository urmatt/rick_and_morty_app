import 'package:bloc/bloc.dart';
import 'package:rick_and_morty_app/data/models/episode.dart';
import 'package:rick_and_morty_app/data/models/info.dart';

import '../../../data/repositories/repositories.dart';

part 'episodes_state.dart';

class EpisodesCubit extends Cubit<EpisodesState> {
  final EpisodesRepository remoteRepository;
  final EpisodesRepository? localRepository;

  EpisodesCubit({
    required this.remoteRepository,
    this.localRepository,
  }) : super(EpisodesInitial());

  void getEpisodes({String? params}) async {
    var local = await localRepository?.getEpisodes(params: params);
    var initial = [...state.episodes];
    if (local != null) {
      emit(EpisodesList(
        [...local.results]..insertAll(0, initial),
        info: local.info,
      ));
    }

    emit(EpisodesLoading().from(state));

    var remote = await remoteRepository.getEpisodes(params: params);
    emit(EpisodesList(
      [...remote.results]..insertAll(0, initial),
      info: remote.info,
      remote: true,
    ));
  }
}
