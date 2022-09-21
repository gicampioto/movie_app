import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../design_system/utils/sizes.dart';
import '../widgets/nav_bar_btn.dart';
import '../bloc/main_frame_bloc.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MainFrameBloc>();

    return Container(
      color: Colors.pink,
      height: AppSizes.barSizes,
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
