import '../domain/entity/page_entity.dart';

abstract class HomeDataSource {
  Future<PageEntity> get(String genre, String page);
}
