import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_app/data/models/character.dart';
import 'package:rick_and_morty_app/data/models/episode.dart';
import 'package:rick_and_morty_app/data/models/info.dart';
import 'package:rick_and_morty_app/domain/cubit/characters/characters_cubit.dart';
import 'package:rick_and_morty_app/domain/cubit/episodes/episodes_cubit.dart';
import 'package:rick_and_morty_app/presentation/core/widgets/cards/character_card.dart';
import 'package:rick_and_morty_app/presentation/core/widgets/scroll_view/load_more_list.dart';
import 'package:rick_and_morty_app/presentation/routes/routes.dart';
import 'package:rick_and_morty_app/presentation/screens/home/pages/characters_list_view.dart';
import 'package:rick_and_morty_app/presentation/screens/home/pages/episodes_list_view.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  Info? current;
  List<Character> characters = [];

  int currentPage = 0;
  Map<String, String>? filterMap;

  @override
  void initState() {
    super.initState();
    context.read<CharactersCubit>().getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: Key("home_app_bar"),
        title: Text("Rick and Morty"),
        actions: [
          PopupMenuButton(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Icon(Icons.filter_alt_rounded),
            ),
            itemBuilder: (ctx) => [
              PopupMenuItem(
                onTap: () => filter("status", "Alive"),
                child: Text("Alive"),
              ),
              PopupMenuItem(
                onTap: () => filter("gender", "Male"),
                child: Text("Male"),
              ),
              PopupMenuItem(
                onTap: () => filter("gender", "Female"),
                child: Text("Female"),
              ),
            ],
          )
        ],
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<CharactersCubit, CharactersState>(listener: (_, state) {
            setState(() => isLoading = state is CharactersLoading);
          }),
          BlocListener<EpisodesCubit, EpisodesState>(listener: (_, state) {
            setState(() => isLoading = state is EpisodesLoading);
          }),
        ],
        child: Stack(
          children: [
            Positioned(
                child: isLoading ? LinearProgressIndicator() : SizedBox()),
            body(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (page) => setState(() => currentPage = page),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Character',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.motion_photos_on),
            label: 'Episode',
          )
        ],
      ),
    );
  }

  void filter(String key, String value) {
    setState(() => filterMap = {key: value});
  }

  Widget body() {
    if (currentPage == 0) {
      return CharactersListView(
        onCharacterClick: onCharacterClick,
        filter: filterMap,
      );
    }
    return EpisodesListView();
  }

  void onCharacterClick(Character character) {
    GetIt.I.registerSingleton<Character>(character);
    Navigator.of(context).pushNamed(Routes.character);
  }

  void onEpisodeClick(Episode episode) {
    Navigator.of(context).pushNamed(Routes.character, arguments: episode);
  }
}
