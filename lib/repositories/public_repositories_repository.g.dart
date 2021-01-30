// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_repositories_repository.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _PublicRepositoriesRepository implements PublicRepositoriesRepository {
  _PublicRepositoriesRepository(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://api.github.com';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<List<PublicRepositoriesModel>> findAll() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/repositories',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            PublicRepositoriesModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }
}
