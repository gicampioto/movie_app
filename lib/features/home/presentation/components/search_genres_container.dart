import 'dart:ui';
import 'package:flutter/material.dart';

import '../../../../design_system/utils/sizes.dart';
import '../bloc/genre/genre_bloc.dart';
import '../../../../design_system/utils/genre_list.dart';
import '../../../../design_system/widgets/icon_btn.dart';
import '../widgets/genre_text_btn.dart';
import '../../../../design_system/utils/style.dart';

class SearchGenresContainer extends StatelessWidget {
  const SearchGenresContainer(this.bloc, {Key? key}) : super(key: key);

  final GenreBloc bloc;

  @override
  Widget build(BuildContext context) {
    // return LayoutBuilder(builder: (context, constraints) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 100, right: 100, top: 40, bottom: 40),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: AppColors.lightPink,
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.lightPink.withOpacity(0.7),
                  AppColors.lightPink.withOpacity(0.7),
                ],
              ),
            ),
            child: Stack(
              children: [
                ListView.builder(
                  itemCount: genresList.length,
                  itemBuilder: (context, index) {
                    return GenreTextBtn(genresList[index], bloc);
                  },
                ),
                Positioned(
                  bottom: AppSizes.halfPadding,
                  right: AppSizes.halfPadding,
                  child: IconBtn(
                    tap: () => bloc.add(GenreHideContainer()),
                    icon: Icons.close,
                    bgColor: Colors.white,
                    iconColor: AppColors.lightPink,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // });
  }
}
