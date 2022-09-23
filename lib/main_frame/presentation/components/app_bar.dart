import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/design_system/utils/sizes.dart';
import 'package:movie_app/design_system/utils/style.dart';

import '../../../design_system/widgets/icon_btn.dart';
import '../bloc/main_frame_bloc.dart';

AppBar appBar(MainFrameBloc bloc) {
  const padding = SizedBox(width: AppSizes.padding);

  Widget title = Center(
    child: BlocBuilder<MainFrameBloc, MainFrameState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is MFPopularViewState) {
          return const Text(
            'Filmes Populares',
            style: TextStyles.barTitle,
          );
        }

        if (state is MFFavoriteViewState) {
          return const Text(
            'Filmes Favoritos',
            style: TextStyles.barTitle,
          );
        }

        return const Text(
          'Filminhos',
          style: TextStyles.barTitle,
        );
      },
    ),
  );

  const Widget themeBtn = IconBtn(
    icon: Icons.sunny,
  );

  const Widget logo = IconBtn(
    icon: Icons.videocam,
  );

  return AppBar(
    toolbarHeight: AppSizes.bars,
    backgroundColor: AppColors.pink,
    actions: [
      padding,
      logo,
      padding,
      title,
      const Spacer(),
      themeBtn,
      padding,
    ],
  );
}
