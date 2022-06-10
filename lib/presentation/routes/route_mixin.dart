import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/data/models/models.dart';
import 'package:rick_and_morty_app/presentation/screens/character/chracter_details.dart';

mixin RouteMixin {
  Future<T?> toCharacterDetails<T>(BuildContext context, Character character) {
    return Navigator.push<T>(
      context,
      MaterialPageRoute(
        builder: (context) => CharacterDetails(character: character),
      ),
    );
  }
}
