import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/design_system/utils/style.dart';
import 'package:movie_app/features/home/external/home_data_source_imp.dart';
import 'package:movie_app/main_frame/presentation/view/main_frame_view.dart';

import 'core/utils/inject.dart';
import 'features/home/infra/data_source/home_data_source.dart';

void main() async {
  await Inject.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Movie App',
      home: MainFrameView(),
    );
  }
}
