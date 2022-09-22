import 'package:movie_app/core/domain/entity/page_entity.dart';

abstract class HomeRepository {
  Future<PageEntity> call(String genre, String page);
}
