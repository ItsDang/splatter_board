// pulled from https://docs.flutter.dev/cookbook/navigation/navigation-basics
import 'package:flutter/material.dart';

import '../Classes/gym.dart';
import 'gym_screen_add.dart';
import 'boards_screen.dart';
import 'drawer_m.dart';

class GymScreen extends StatelessWidget {
  const GymScreen({super.key, required this.gyms});

  final List<Gym> gyms;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gyms'),
        leading: (ModalRoute.of(context)?.canPop ?? false)
            ? const BackButton()
            : null,
      ),
      body: ListView.builder(
        itemCount: gyms.length,
        prototypeItem: ListTile(
          // not sure what prototypeItem does
          title: Text(gyms.first.name),
        ),
        itemBuilder: (context, index) {
          // here we need to take from the item list, which should eventually be
          // a list of climb objects
          // climb containing name, grade, angle, hands[], feet[], start, fin
          // maybe a couple more variables
          return ListTile(
            // leading: Image(image: AssetImage('assets/${gyms[index].name}.png')),
            title: Text(gyms[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        BoardsScreen(boards: gyms[index].boards)),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddGymScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
      endDrawer: const DrawerScreen(),
    );
  }
}
