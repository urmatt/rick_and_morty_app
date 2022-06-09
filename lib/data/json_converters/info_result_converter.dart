import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty_app/data/models/character.dart';
import 'package:rick_and_morty_app/data/models/episode.dart';
import 'package:rick_and_morty_app/data/models/location.dart';

class InfoResultConverter<T> implements JsonConverter<T, Object> {
  const InfoResultConverter();

  @override
  T fromJson(Object json) {
    if (json is Map<String, dynamic>) {
      if (json.containsKey('gender') && json.containsKey('status')) {
        return Character.fromJson(json) as T;
      } else if (json.containsKey('type') &&
          json.containsKey('dimension') &&
          json.containsKey('residents')) {
        return Location.fromJson(json) as T;
      } else if (json.containsKey('episode') &&
          json.containsKey('characters')) {
        return Episode.fromJson(json) as T;
      }
    }
    return json as T;
  }

  @override
  Object toJson(T object) {
    if (T is Character) {
      return (object as Character).toJson();
    } else if (T is Episode) {
      return (object as Episode).toJson();
    } else if (T is Location) {
      return (object as Location).toJson();
    }
    return object as Object;
  }
}
