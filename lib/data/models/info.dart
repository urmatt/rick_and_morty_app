import 'package:json_annotation/json_annotation.dart';

part 'info.g.dart';

@JsonSerializable()
class Info {
  Info({
    this.count = 0,
    this.pages = 0,
    this.next,
    this.prev,
  });

  final int count;
  final int pages;
  final String? next;
  final String? prev;

  String get nextPageParams {
    return next?.split('?').last ?? "";
  }

  Map<String, String> get nextParamsMap {
    if (next != null) {
      var uri = Uri.parse(next!);
      return uri.queryParameters;
    }
    return {};
  }

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);

  Map<String, dynamic> toJson() => _$InfoToJson(this);
}
