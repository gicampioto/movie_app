import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/design_system/utils/style.dart';
import 'package:movie_app/features/home/presentation/view/home_view.dart';
import 'package:movie_app/features/movie/presentation/view/movie_view.dart';

import 'package:movie_app/main_frame/presentation/components/app_bar.dart';
import 'package:movie_app/main_frame/presentation/components/nav_bar.dart';

import '../bloc/main_frame_bloc.dart';

class MainFrameView extends StatefulWidget {
  const MainFrameView({Key? key}) : super(key: key);

  @override
  State<MainFrameView> createState() => _MainFrameViewState();
}

class _MainFrameViewState extends State<MainFrameView> {
  late MainFrameBloc bloc;

  @override
  void initState() {
    super.initState();

    bloc = GetIt.instance.get<MainFrameBloc>();
  }

  @override
  void dispose() {
    bloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainFrameBloc>.value(
      value: bloc,
      child: Scaffold(
        appBar: appBar(),
        bottomNavigationBar: const NavBar(),
        body: BlocBuilder<MainFrameBloc, MainFrameState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is MFHomeViewState) {
              return const HomeView();
            }

            if (state is MFFavoriteViewState) {
              return Container(
                color: Colors.amber,
                child: const Center(child: Text('favorite')),
              );
            }

            if (state is MFPopularViewState) {
              return Container(
                color: Colors.amber,
                child: const Center(child: Text('popular')),
              );
            }

            if (state is MFMovieViewState) {
              return MovieView(movie: state.movie);
            }

            return Container(
              color: Colors.amber,
              child: const Center(child: Text('main frame')),
            );
          },
        ),
      ),
    );
  }
}
