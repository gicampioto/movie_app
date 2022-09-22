import 'package:movie_app/features/home/domain/entity/page_entity.dart';

import '../../domain/repository/home_repository.dart';
import '../data_source/home_data_source.dart';

class HomeRepositoryImp extends HomeRepository {
  HomeRepositoryImp(this.dataSource);

  final HomeDataSource dataSource;
  @override
  Future<PageEntity> call(String genre, String page) async {
    try {
      return await dataSource.get(genre, page);
    } catch (e) {
      throw Exception();
    }
  }
}
