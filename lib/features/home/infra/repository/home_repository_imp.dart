import 'package:get_it/get_it.dart';
import 'package:movie_app/core/utils/error_handler.dart';
import 'package:movie_app/core/domain/entity/page_entity.dart';

import '../../domain/repository/home_repository.dart';
import '../data_source/home_data_source.dart';

final $HomeRepositoryImp = GetIt.I.registerLazySingleton<HomeRepository>(
  () => HomeRepositoryImp(GetIt.I()),
);

class HomeRepositoryImp extends HomeRepository {
  HomeRepositoryImp(this.dataSource);

  final HomeDataSource dataSource;
  @override
  Future<PageEntity> call(String genre, String page) async {
    try {
      return await dataSource(genre, page);
    } catch (e, stackTrace) {
      throw ErrorHandler.handleErrors(e, stackTrace);
    }
  }
}
