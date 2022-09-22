import '../../../../core/domain/entity/page_entity.dart';

abstract class GetMoviesByGenre {
  Future<PageEntity> call(String genre, int page);
}
