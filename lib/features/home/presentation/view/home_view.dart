import 'package:flutter/material.dart';

import '../../../../design_system/utils/sizes.dart';
import '../components/movie_card.dart';
import '../widgets/pill_header.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            ListView(
              padding: const EdgeInsets.all(AppSizes.padding),
              children: const [
                SizedBox(height: 15),
                HomeMovieCard(),
                HomeMovieCard(),
                HomeMovieCard(),
                HomeMovieCard(),
                HomeMovieCard(),
                //TODO: colocar o contador de paginas
              ],
            ),
            PillHeader(constraints),
          ],
        );
      }),
    );
  }
}
