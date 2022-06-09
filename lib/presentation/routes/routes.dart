import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_app/data/repositories/repositories.dart';
import 'package:rick_and_morty_app/domain/cubit/characters/characters_cubit.dart';
import 'package:rick_and_morty_app/domain/cubit/episodes/episodes_cubit.dart';
import 'package:rick_and_morty_app/presentation/screens/character/chracter_details.dart';
import 'package:rick_and_morty_app/presentation/screens/home/home_screen.dart';

class Routes {
  static const home = "/";
  static const character = "/character";
  static const location = "/location";
  static const episode = "/episode";

  static final Map<String, WidgetBuilder> map = {
    home: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<CharactersCubit>(
              create: (context) => CharactersCubit(
                remoteRepository: GetIt.I<CharactersRemoteRepo>(),
                localRepository: GetIt.I<CharactersLocalRepo>(),
              ),
            ),
            BlocProvider(
              create: (context) => EpisodesCubit(
                remoteRepository: GetIt.I<EpisodesRemoteRepo>(),
                localRepository: GetIt.I<EpisodesLocalRepo>(),
              ),
            )
          ],
          child: HomeScreen(),
        ),
    character: (context) => CharacterDetails(),
    // location: (context) =>
  };
}
