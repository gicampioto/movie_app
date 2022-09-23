import '../../../../core/domain/entity/movie_entity.dart';

abstract class PopularRepository {
  Future<List<MovieEntity>> call();
}
