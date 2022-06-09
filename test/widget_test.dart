// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:localstorage/localstorage.dart';
import 'package:rick_and_morty_app/data/api/clients/characters.dart';
import 'package:rick_and_morty_app/data/api/clients/episodes.dart';
import 'package:rick_and_morty_app/data/repositories/repositories.dart';
import 'package:rick_and_morty_app/presentation/app.dart';
import 'package:dio/dio.dart';

void main() {
  injectNetClient();
  injectRepos();
  testWidgets('Characters & episodes list test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const RickAndMortyApp());

    // Verify that our counter starts at 0.
    expect(find.byKey(Key('bottom_navigation')), findsOneWidget);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.people));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.byKey(Key('characters_list')), findsOneWidget);

    await tester.tap(find.byIcon(Icons.motion_photos_on));
    await tester.pump();

    expect(find.byKey(Key('episodes_list')), findsOneWidget);
  });
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
