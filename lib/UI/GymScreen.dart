// pulled from https://docs.flutter.dev/cookbook/navigation/navigation-basics
import 'package:flutter/material.dart';

import '../Classes/gym.dart';
import 'BoardScreen.dart';
import 'DrawerScreen.dart';

class GymScreen extends StatelessWidget {
  const GymScreen({super.key, required this.gym});

  final Gym gym;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gym Screen'),
        leading: (ModalRoute.of(context)?.canPop ?? false)
            ? const BackButton()
            : null,
      ),
      body: ListView.builder(
        itemCount: gym.boards.length,
        prototypeItem: ListTile(
          // not sure what prototypeItem does
          title: Text(gym.boards.first.name),
        ),
        itemBuilder: (context, index) {
          // here we need to take from the item list, which should eventually be
          // a list of climb objects
          // climb containing name, grade, angle, hands[], feet[], start, fin
          // maybe a couple more variables
          return ListTile(
            leading: Image(
                image: AssetImage('assets/${gym.boards[index].type.name}.png')),
            title: Text(gym.boards[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        BoardScreen(board: gym.boards[index])),
              );
            },
          );
        },
      ),
      endDrawer: const DrawerScreen(),
    );
  }
}
