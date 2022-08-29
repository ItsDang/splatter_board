import 'package:flutter/material.dart';
import 'package:splatter_board/Classes/board_type.dart';
import 'package:splatter_board/Classes/grades.dart';
import 'package:splatter_board/UI/gyms_screen.dart';

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

  static Gym columbia = Gym(
      'Movement Columbia',
      39.17800016499594,
      -76.81134727245592,
      [
        Board('Splatter', BoardType.splatter, [
          Climb('Movcment_Columbia_0.jpg', '0', Grades.v2, 30, [0], [], [], 0),
          Climb('Movcment_Columbia_0.jpg', '0', Grades.v3, 30, [0], [], [], 0)
        ]),
        Board('Tension', BoardType.tension, [
          Climb('Movcment_Columbia_0.jpg', '0', Grades.v5, 30, [0], [], [], 0)
        ])
      ],
      'Movement Gyms',
      false);
  static Gym rockville = Gym(
      'Movement Rockville',
      39.0785436,
      -77.1434205,
      [
        Board('Splatter', BoardType.splatter, [
          Climb('Movcment_Columbia_0.jpg', '0', Grades.v2, 30, [0], [], [], 0)
        ])
      ],
      'Movement Gyms',
      false);
  final List<Gym> gyms = [columbia, rockville];

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GymScreen(
        gyms: gyms,
      ),
    );
  }
}
