import '../../../../core/domain/entity/page_entity.dart';

abstract class HomeDataSource {
  Future<PageEntity> call(String genre, String page);
}
