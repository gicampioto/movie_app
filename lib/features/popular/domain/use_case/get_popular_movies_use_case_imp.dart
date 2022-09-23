import 'package:get_it/get_it.dart';

import '../../../../core/domain/entity/movie_entity.dart';
import '../repository/popular_repository.dart';
import 'get_popular_movies_use_case.dart';

final $GetPopularMoviesImp = GetIt.I.registerLazySingleton<GetPopularMovies>(
    () => GetPopularMoviesImp(GetIt.I()));

class GetPopularMoviesImp extends GetPopularMovies {
  GetPopularMoviesImp(this.repository);

  final PopularRepository repository;

  @override
  Future<List<MovieEntity>> call() async {
    return await repository();
  }
}
