import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/presentation/routes/routes.dart';

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty app',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: Routes.home,
      routes: Routes.map,
    );
  }
}
