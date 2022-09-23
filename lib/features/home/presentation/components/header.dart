import 'package:flutter/material.dart';
import 'package:movie_app/design_system/widgets/icon_btn.dart';
import 'package:movie_app/features/home/presentation/bloc/genre/genre_bloc.dart';

import '../../../../design_system/utils/style.dart';
import '../../../../design_system/utils/sizes.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader(
    this.constraints, {
    super.key,
    this.genre,
    required this.bloc,
  });

  final BoxConstraints constraints;
  final String? genre;
  final GenreBloc bloc;

  @override
  Widget build(BuildContext context) {
    Widget title = Text(
      genre ?? 'Populares',
      style: TextStyles.title,
    );

    return Positioned(
      top: 5,
      width: constraints.maxWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
            decoration: BoxDecoration(
              color: AppColors.pink,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 4,
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            height: 30,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Genêro: ', style: TextStyles.title),
                title,
                IconBtn(
                  tap: () => bloc.add(GenreShowContainer()),
                  icon: Icons.arrow_drop_down,
                  size: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
