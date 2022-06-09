import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:localstorage/localstorage.dart';
import 'package:rick_and_morty_app/data/api/clients/episodes.dart';
import 'package:rick_and_morty_app/presentation/app.dart';
import 'package:rick_and_morty_app/data/api/clients/characters.dart';
import 'package:rick_and_morty_app/data/repositories/repositories.dart';
import 'package:dio/dio.dart';

void main() {
  injectNetClient();
  injectRepos();
  runApp(const RickAndMortyApp());
}

void injectNetClient() {
  var dio = Dio();
  GetIt.I.registerSingleton<Dio>(dio);
  GetIt.I.registerSingleton<CharactersClient>(CharactersClient(dio));
  GetIt.I.registerSingleton<EpisodesClient>(EpisodesClient(dio));
}

void injectRepos() {
  injectLocalStorage();
  GetIt.I.registerSingleton<CharactersRemoteRepo>(CharactersRemoteRepo());
  GetIt.I.registerSingleton<CharactersLocalRepo>(CharactersLocalRepo());

  GetIt.I.registerSingleton<EpisodesRemoteRepo>(EpisodesRemoteRepo());
  GetIt.I.registerSingleton<EpisodesLocalRepo>(EpisodesLocalRepo());
}

void injectLocalStorage() {
  GetIt.I.registerSingleton<LocalStorage>(LocalStorage('rick_and_morty'));
}
