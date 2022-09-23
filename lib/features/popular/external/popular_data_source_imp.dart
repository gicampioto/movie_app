import 'package:get_it/get_it.dart';

import '../../../core/domain/entity/movie_entity.dart';
import '../../../core/domain/services/app_dio.dart';
import '../../../core/utils/api_paths.dart';
import '../../../core/domain/entity/page_entity.dart';
import '../../../core/infra/dto/movie_dto.dart';
import '../../../core/infra/services/the_movie_db_service.dart';
import '../infra/data_source/popular_data_source.dart';

final $PopularDataSourceImp = GetIt.I.registerLazySingleton<PopularDataSource>(
  () => PopularDataSourceImp(TheMovieDBService()),
);

class PopularDataSourceImp extends PopularDataSource {
  PopularDataSourceImp(this.service);

  final AppDio service;

  @override
  Future<List<MovieEntity>> call() async {
    final respose = await service.get(ApiPath().getPopular());

    var jsonData = respose.data;

    var jsonResults = jsonData['results'];

    List<MovieEntity> movies = [];

    for (var json in jsonResults) {
      movies.add(MovieDto.fromJson(json));
    }

    return movies;
  }
}
