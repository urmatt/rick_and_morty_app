import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/data/models/models.dart';
import 'package:rick_and_morty_app/domain/cubit/characters/characters_cubit.dart';
import 'package:rick_and_morty_app/presentation/core/widgets/widgets.dart';

class CharactersListView extends StatefulWidget {
  final Function(Character character)? onCharacterClick;
  final Map<String, String>? filter;

  const CharactersListView({
    Key? key,
    this.onCharacterClick,
    this.filter,
  }) : super(key: key);

  @override
  State<CharactersListView> createState() => _CharactersListViewState();
}

class _CharactersListViewState extends State<CharactersListView> {
  bool isLoading = false;
  Info? current;
  List<Character> characters = [];

  @override
  void initState() {
    super.initState();
    context.read<CharactersCubit>().getCharacters(filter: widget.filter);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CharactersCubit, CharactersState>(
      listener: charactersBlocListener,
      child: LoadMoreList(
        finish: current?.next == null,
        loading: isLoading,
        onLoadMore: _onLoadMore,
        children: characters.map((character) {
          return CharacterCard(
            character,
            onTap: widget.onCharacterClick,
          );
        }).toList(),
      ),
    );
  }

  void charactersBlocListener(BuildContext context, CharactersState state) {
    if (state is CharactersLoading) {
      isLoading = true;
    } else if (state is CharactersList) {
      setState(() {
        current = state.info;
        characters = state.characters;
        isLoading = false;
      });
    } else {
      isLoading = false;
    }
  }

  void _onLoadMore() {
    if (!isLoading) {
      context.read<CharactersCubit>().getCharacters(
          params: current?.nextPageParams, filter: widget.filter);
    }
  }
}
