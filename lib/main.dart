import 'package:flutter/material.dart';
import 'package:movie_app/main_frame/presentation/view/main_frame_view.dart';

import 'core/utils/inject.dart';

void main() async {
  await Inject.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MainFrameView(),
    );
  }
}
