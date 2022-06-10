import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/data/models/character.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rick_and_morty_app/presentation/core/widgets/character_status.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  final Function(Character character)? onTap;

  const CharacterCard(
    this.character, {
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imageSize = MediaQuery.of(context).size.height / 6;
    return InkWell(
      onTap: () => onTap?.call(character),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: CachedNetworkImage(
                width: imageSize,
                height: imageSize * 0.7,
                imageUrl: character.image,
                fit: BoxFit.fitHeight,
                progressIndicatorBuilder: onLoading,
                errorWidget: (_, __, ___) => Icon(Icons.close),
              ),
            ),
            SizedBox(width: 8),
            Flexible(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
            )
          ],
        ),
      ),
    );
  }

  Widget onLoading(
      BuildContext context, String url, DownloadProgress progress) {
    return CircularProgressIndicator(
      value: progress.progress,
    );
  }
}
