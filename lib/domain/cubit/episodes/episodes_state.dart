part of 'episodes_cubit.dart';

abstract class EpisodesState {
  List<Episode> episodes;
  Info? info;
  bool remote;

  EpisodesState({
    this.episodes = const [],
    this.remote = false,
    this.info,
  });

  EpisodesState from(EpisodesState state) {
    episodes = state.episodes;
    remote = state.remote;
    info = state.info;
    return this;
  }
}

class EpisodesInitial extends EpisodesState {}

class EpisodesLoading extends EpisodesState {}

class EpisodesList extends EpisodesState {
  EpisodesList(
    List<Episode> episodes, {
    bool remote = false,
    Info? info,
  }) : super(
          episodes: episodes,
          remote: remote,
          info: info,
        );
}

class EpisodeError extends EpisodesState {
  final String message;

  EpisodeError(this.message);
}
