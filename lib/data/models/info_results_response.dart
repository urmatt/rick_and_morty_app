import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty_app/data/json_converters/info_result_converter.dart';
import 'info.dart';

part 'info_results_response.g.dart';

@JsonSerializable()
class InfoResults<T> {
  InfoResults({
    required this.info,
    required this.results,
  });

  Info info;

  @InfoResultConverter()
  List<T> results;

  factory InfoResults.fromJson(Map<String, dynamic> json) =>
      _$InfoResultsFromJson(json);

  Map<String, dynamic> toJson() => _$InfoResultsToJson(this);
}
