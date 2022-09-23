import 'package:flutter/material.dart';

import 'main_frame/presentation/view/main_frame_view.dart';
import 'core/utils/inject.dart';

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
