import 'package:flutter/material.dart';
import 'package:movie_app/main_frame/presentation/bloc/main_frame_bloc.dart';

import '../../../design_system/widgets/icon_btn.dart';

class NavBarBtn extends StatelessWidget {
  const NavBarBtn(
      {Key? key, required this.icon, required this.tap, required this.btnOn})
      : super(key: key);

  final IconData icon;
  final Function() tap;
  final bool btnOn;

  factory NavBarBtn.home(MainFrameBloc bloc) {
    bool btnOn = bloc.state is MFHomeViewState;
    return NavBarBtn(
      icon: Icons.home,
      tap: () {
        if (btnOn) return;
        bloc.add(MFTapHomeEvent());
      },
      btnOn: btnOn,
    );
  }

  factory NavBarBtn.favorite(MainFrameBloc bloc) {
    bool btnOn = bloc.state is MFFavoriteViewState;
    return NavBarBtn(
      icon: Icons.favorite,
      tap: () {
        if (btnOn) return;
        bloc.add(MFTapFavoriteEvent());
      },
      btnOn: btnOn,
    );
  }

  factory NavBarBtn.popular(MainFrameBloc bloc) {
    bool btnOn = bloc.state is MFPopularViewState;
    return NavBarBtn(
      icon: Icons.star,
      tap: () {
        if (btnOn) return;
        bloc.add(MFTapPopularEvent());
      },
      btnOn: btnOn,
    );
  }

  @override
  Widget build(BuildContext context) {
    Color color = Colors.white;

    return Container(
      width: 80,
      decoration: BoxDecoration(
        border: btnOn
            ? Border(
                bottom: BorderSide(
                  color: color,
                  width: 2.0,
                ),
              )
            : null,
      ),
      child: IconBtn(
        tap: tap,
        icon: icon,
        iconColor: color,
      ),
    );
  }
}
