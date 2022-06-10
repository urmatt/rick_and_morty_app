import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/data/models/character.dart';

class CharacterStatus extends StatelessWidget {
  final Character character;

  const CharacterStatus(
    this.character, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.circle,
          size: 10,
          color: character.isAlive
              ? Colors.green
              : character.isDead
                  ? Colors.red
                  : Colors.grey,
        ),
        SizedBox(width: 4),
        Text(character.status),
      ],
    );
  }
}
