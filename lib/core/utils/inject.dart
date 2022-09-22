import '../../features/home/domain/use_case/get_movies_by_genre_use_case_imp.dart';
import '../../features/home/infra/repository/home_repository_imp.dart';
import '../infra/services/the_movie_db_service.dart';
import '../../features/home/external/home_data_source_imp.dart';
import '../../main_frame/presentation/bloc/main_frame_bloc.dart';

class Inject {
  static init() async {
    //SERVICES
    $MovieService;

    // MAIN_FRAME
    //Controller
    $MainFrameBloc;

    //HOME
    //datasource
    $HomeDataSourceImp;
    //repository
    $HomeRepositoryImp;
    //usecase
    $GetMoviesByGenreImp;
  }
}
