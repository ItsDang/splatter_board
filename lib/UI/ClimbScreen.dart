import 'package:flutter/material.dart';

import '../Classes/climb.dart';
import 'DrawerScreen.dart';

class ClimbScreen extends StatelessWidget {
  const ClimbScreen({super.key, required this.climb});

  final Climb climb;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(climb.name),
        leading: (ModalRoute.of(context)?.canPop ?? false)
            ? const BackButton()
            : null,
      ),
      body: Column(children: <Widget>[
        Image(image: AssetImage('assets/${climb.path}')),
        Row(children: <Widget>[
          Text(climb.grade),
          Text(climb.angle),
        ]),
      ]),
      endDrawer: const DrawerScreen(),
    );
  }
}
