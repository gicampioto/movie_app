import '../../../../core/domain/entity/movie_entity.dart';

abstract class PopularDataSource {
  Future<List<MovieEntity>> call();
}
