import 'package:flutter/material.dart';
import 'package:splatter_board/Classes/boardType.dart';
import 'package:splatter_board/UI/GymScreen.dart';

import 'Classes/board.dart';
import 'Classes/climb.dart';
import 'Classes/gym.dart';

void main() {
  runApp(
    MyApp(),
  );
}

/*
template
https://docs.flutter.dev/cookbook/lists/long-lists
https://docs.flutter.dev/cookbook/design/drawer
https://docs.flutter.dev/development/ui/assets-and-images
*/

class MyApp extends StatelessWidget {
  static const appTitle = 'SplatterBoard';

  final gym = Gym(
      'Movement Columbia',
      39.17800016499594,
      -76.81134727245592,
      [
        Board('local', boardType.Splatter, [
          Climb('Movcment_Columbia_0.jpg', '0', 'v2', '30', [0], [], [], 0)
        ])
      ],
      'Movement Gyms',
      false);

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GymScreen(
        gym: gym,
      ),
    );
  }
}
