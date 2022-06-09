// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episodes.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _EpisodesClient implements EpisodesClient {
  _EpisodesClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://rickandmortyapi.com/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<InfoResults<Episode>> getEpisodes({params}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<InfoResults<Episode>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/episode/?${params}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = InfoResults<Episode>.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
