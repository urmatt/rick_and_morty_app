import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/data/api/clients/characters.dart';

void main() {
  final dio = Dio();
  final client = CharactersClient(dio);

  test('get characters test', () async {
    var clients = await client.getCharacters();

    expect(true, clients.results.isNotEmpty);
  });

  test('get characters next page', () async {
    var clients = await client.getCharacters(params: "page=2");

    expect(true, clients.results.isNotEmpty);
    expect(true, clients.results.length == 20);
  });
}
