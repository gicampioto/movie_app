import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/design_system/utils/style.dart';
import 'package:movie_app/design_system/widgets/icon_btn.dart';
import 'package:movie_app/features/home/presentation/bloc/home/home_bloc.dart';

class PageCountContainer extends StatelessWidget {
  const PageCountContainer({
    Key? key,
    required this.currentPage,
    required this.totalPages,
    required this.genre,
  }) : super(key: key);

  final int currentPage;
  final int totalPages;
  final String genre;

  @override
  Widget build(BuildContext context) {
    Color colors = AppColors.darkPink;

    Widget arrowBack = IconBtn(
      icon: Icons.arrow_back,
      iconColor: currentPage == 1 ? colors.withOpacity(0.5) : colors,
      tap: () {
        if (currentPage == 1) return;
        context.read<HomeBloc>().add(HomeRequestMovies(genre, currentPage - 1));
      },
    );
    Widget arrowForward = IconBtn(
      icon: Icons.arrow_forward,
      iconColor: currentPage == totalPages ? colors.withOpacity(0.5) : colors,
      tap: () {
        if (currentPage == totalPages) return;
        context.read<HomeBloc>().add(HomeRequestMovies(genre, currentPage + 1));
      },
    );

    Widget current = Text(
      currentPage.toString(),
      style: TextStyle(color: colors),
    );

    return Positioned(
      bottom: 0,
      right: 0,
      child: Container(
        height: 30,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            arrowBack,
            current,
            arrowForward,
          ],
        ),
      ),
    );
  }
}
