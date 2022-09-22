import 'package:get_it/get_it.dart';

import '../../../core/domain/entity/movie_entity.dart';
import '../../../core/domain/services/app_dio.dart';
import '../../../core/utils/api_paths.dart';
import '../../../core/domain/entity/page_entity.dart';
import '../../../core/infra/dto/movie_dto.dart';
import '../../../core/infra/services/the_movie_db_service.dart';
import '../infra/data_source/home_data_source.dart';

final $HomeDataSourceImp = GetIt.I.registerLazySingleton<HomeDataSource>(
  () => HomeDataSourceImp(TheMovieDBService()),
);

class HomeDataSourceImp extends HomeDataSource {
  HomeDataSourceImp(this.service);

  final AppDio service;

  @override
  Future<PageEntity> call(String genre, String page) async {
    final respose = await service.get(ApiPath().getByGenre(genre, page));

    var jsonData = respose.data;

    var jsonResults = jsonData['results'];

    List<MovieEntity> movies = [];

    for (var json in jsonResults) {
      movies.add(MovieDto.fromJson(json));
    }

    PageEntity homePage = PageEntity(
      currentPage: page,
      totalPages: jsonData['total_pages'],
      movies: movies,
    );

    return homePage;
  }
}
