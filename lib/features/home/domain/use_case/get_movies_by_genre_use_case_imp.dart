import 'package:get_it/get_it.dart';
import 'package:movie_app/features/home/domain/repository/home_repository.dart';

import '../../../../design_system/utils/genre_list.dart';
import 'get_movies_by_genre_use_case.dart';
import '../../../../core/domain/entity/page_entity.dart';

final $GetMoviesByGenreImp = GetIt.I.registerLazySingleton<GetMoviesByGenre>(
  () => GetMoviesByGenreImp(GetIt.I()),
);

class GetMoviesByGenreImp extends GetMoviesByGenre {
  GetMoviesByGenreImp(this.repository);

  final HomeRepository repository;

  @override
  Future<PageEntity> call(String genre, int page) async {
    return await repository(genreIds[genre]!, page.toString());
  }
}
