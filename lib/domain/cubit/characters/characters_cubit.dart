import 'package:bloc/bloc.dart';
import 'package:rick_and_morty_app/data/models/models.dart';
import 'package:rick_and_morty_app/data/repositories/repositories.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository remoteRepository;
  final CharactersRepository? localRepository;

  CharactersCubit({
    required this.remoteRepository,
    this.localRepository,
  }) : super(CharactersInitial());

  void getCharacters({String? params, Map<String, String>? filter}) async {
    emit(CharactersLoading().from(state));
    var initial = [...state.characters];

    localRepository?.getCharacters(params: params).then((local) {
      var list = [...local.results]..insertAll(0, initial);
      if (filter != null) {
        list = list..where((e) => e.isInFilter(filter));
      }
      emit(CharactersList(
        list,
        info: local.info,
      ));
    });

    var remote =
        await remoteRepository.getCharacters(params: params, filter: filter);
    emit(CharactersList(
      [...remote.results]..insertAll(0, initial),
      info: remote.info,
      remote: true,
    ));
  }
}
