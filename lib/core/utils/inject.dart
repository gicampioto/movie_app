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
  }
}
