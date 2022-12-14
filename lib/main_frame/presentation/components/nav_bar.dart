import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/design_system/utils/style.dart';

import '../../../design_system/utils/sizes.dart';
import '../widgets/nav_bar_btn.dart';
import '../bloc/main_frame_bloc.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MainFrameBloc>();

    return Container(
      color: AppColors.pink,
      height: AppSizes.bars,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
        child: BlocBuilder<MainFrameBloc, MainFrameState>(
          bloc: bloc,
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavBarBtn.popular(bloc),
                NavBarBtn.home(bloc),
                NavBarBtn.favorite(bloc),
              ],
            );
          },
        ),
      ),
    );
  }
}
