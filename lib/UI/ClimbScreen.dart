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
      body: SizedBox(
        child: Column(children: <Widget>[
          Expanded(
            flex: 11,
            child: SizedBox(
              child: Image(image: AssetImage('assets/${climb.path}')),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              child: Row(children: <Widget>[
                Expanded(
                  child: Center(
                      child: Image(
                          image: AssetImage('assets/${climb.grade}.png'))),
                ),
                Expanded(
                  child: Center(child: Text(climb.angle)),
                ),
                Expanded(
                  child: Center(child: Text(climb.grade)),
                ),
              ]),
            ),
          ),
        ]),
      ),
      endDrawer: const DrawerScreen(),
    );
  }
}
