import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/data/models/character.dart';
import 'package:rick_and_morty_app/presentation/core/widgets/widgets.dart';

class CharacterDetails extends StatelessWidget {
  final Character character;

  const CharacterDetails({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: character.image,
              fit: BoxFit.fitWidth,
              errorWidget: (_, __, ___) => Icon(Icons.close),
            ),
            Text(
              character.name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            CharacterStatus(character),
            Text(
              "Last known location:",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(character.location.name),
            Text(
              "Gender:",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(character.gender),
          ],
        ),
      ),
    );
  }
}
