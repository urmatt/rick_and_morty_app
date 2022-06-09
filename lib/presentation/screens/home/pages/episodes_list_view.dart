import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/data/models/models.dart';
import 'package:rick_and_morty_app/domain/cubit/episodes/episodes_cubit.dart';
import 'package:rick_and_morty_app/presentation/core/controllers/filter_controller.dart';
import 'package:rick_and_morty_app/presentation/core/widgets/widgets.dart';

class EpisodesListView extends StatefulWidget {
  final Function(Episode episode)? onEpisodeClick;
  final FilterController? filterController;

  const EpisodesListView({
    Key? key,
    this.onEpisodeClick,
    this.filterController,
  }) : super(key: key);

  @override
  State<EpisodesListView> createState() => _EpisodesListViewState();
}

class _EpisodesListViewState extends State<EpisodesListView> {
  bool isLoading = false;
  Info? current;
  List<Episode> episodes = [];

  @override
  void initState() {
    super.initState();
    widget.filterController?.addFilterChangeListener((filter) {
      context.read<EpisodesCubit>().getEpisodes();
    });
    context.read<EpisodesCubit>().getEpisodes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EpisodesCubit, EpisodesState>(
      listener: episodesBlocListener,
      child: LoadMoreList(
        finish: current?.next == null,
        loading: isLoading,
        onLoadMore: _onLoadMore,
        children: episodes.map((episode) {
          return ListTile(
            title: Text(episode.name),
          );
        }).toList(),
      ),
    );
  }

  void episodesBlocListener(BuildContext context, EpisodesState state) {
    if (state is EpisodesLoading) {
      isLoading = true;
    } else if (state is EpisodesList) {
      setState(() {
        current = state.info;
        episodes = state.episodes;
        isLoading = false;
      });
    } else {
      isLoading = false;
    }
  }

  void _onLoadMore() {
    if (!isLoading) {
      context
          .read<EpisodesCubit>()
          .getEpisodes(params: current?.nextPageParams);
    }
  }
}
