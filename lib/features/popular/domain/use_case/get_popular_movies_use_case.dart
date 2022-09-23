import '../../../../core/domain/entity/movie_entity.dart';

abstract class GetPopularMovies {
  Future<List<MovieEntity>> call();
}
