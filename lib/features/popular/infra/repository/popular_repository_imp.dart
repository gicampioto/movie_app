import 'package:get_it/get_it.dart';

import '../../../../core/domain/entity/movie_entity.dart';
import '../../../../core/utils/error_handler.dart';
import '../../domain/repository/popular_repository.dart';
import '../data_source/popular_data_source.dart';

final $PopularRepositoryImp = GetIt.I.registerLazySingleton<PopularRepository>(
  () => PopularRepositoryImp(GetIt.I()),
);

class PopularRepositoryImp extends PopularRepository {
  PopularRepositoryImp(this.dataSource);

  final PopularDataSource dataSource;

  @override
  Future<List<MovieEntity>> call() async {
    try {
      return await dataSource();
    } catch (e, stackTrace) {
      throw ErrorHandler.handleErrors(e, stackTrace);
    }
  }
}
