part of 'characters_cubit.dart';

abstract class CharactersState {
  List<Character> characters;
  Info? info;
  bool remote;

  CharactersState({
    this.characters = const [],
    this.remote = false,
    this.info,
  });

  CharactersState copyWith({
    List<Character>? characters,
    Info? info,
    bool? remote,
  }) {
    return CharactersList(
      characters ?? this.characters,
      info: info ?? this.info,
      remote: remote ?? this.remote,
    );
  }

  CharactersState from(CharactersState state) {
    characters = state.characters;
    remote = state.remote;
    info = state.info;
    return this;
  }
}

class CharactersInitial extends CharactersState {}

class CharactersLoading extends CharactersState {}

class CharactersList extends CharactersState {
  CharactersList(
    List<Character> characters, {
    bool remote = false,
    Info? info,
  }) : super(
          characters: characters,
          remote: remote,
          info: info,
        );
}

class CharacterError extends CharactersState {
  final String message;

  CharacterError(this.message);
}
