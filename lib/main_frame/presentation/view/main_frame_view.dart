import 'package:flutter/material.dart';

import 'package:movie_app/main_frame/presentation/components/app_bar.dart';
import 'package:movie_app/main_frame/presentation/components/nav_bar.dart';

class MainFrameView extends StatelessWidget {
  const MainFrameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      bottomNavigationBar: const NavBar(),
      body: Container(
        color: Colors.amber,
        child: const Center(child: Text('main frame')),
      ),
    );
  }
}
