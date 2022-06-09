// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_results_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoResults<T> _$InfoResultsFromJson<T>(Map<String, dynamic> json) =>
    InfoResults<T>(
      info: Info.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>)
          .map((e) => InfoResultConverter<T>().fromJson(e as Object))
          .toList(),
    );

Map<String, dynamic> _$InfoResultsToJson<T>(InfoResults<T> instance) =>
    <String, dynamic>{
      'info': instance.info.toJson(),
      'results': instance.results.map(InfoResultConverter<T>().toJson).toList(),
    };
