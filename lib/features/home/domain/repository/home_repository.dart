import 'package:movie_app/features/home/domain/entity/page_entity.dart';

abstract class HomeRepository {
  Future<PageEntity> call(String genre, String page);
}
