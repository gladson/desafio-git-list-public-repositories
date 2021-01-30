import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:desafio_git_list_public_repositories/utils/constants.dart';
import 'package:desafio_git_list_public_repositories/models/public_repositories_model.dart';

part 'public_repositories_repository.g.dart';

@RestApi(baseUrl: BASE_URL_API)
abstract class PublicRepositoriesRepository {
  factory PublicRepositoriesRepository(Dio dio, {String baseUrl}) =
      _PublicRepositoriesRepository;

  @GET('/repositories')
  Future<List<PublicRepositoriesModel>> findAll();
}
