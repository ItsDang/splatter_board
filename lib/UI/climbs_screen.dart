// use https://api.flutter.dev/flutter/material/ListTile-class.html later to customize list view

import 'package:flutter/material.dart';

import '../Classes/climb.dart';
import 'climb_screen_add.dart';
import 'climb_screen.dart';
import 'drawer_m.dart';

class ClimbsScreen extends StatelessWidget {
  const ClimbsScreen({super.key, required this.climbs});

  final List<Climb> climbs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Climbs'),
        leading: (ModalRoute.of(context)?.canPop ?? false)
            ? const BackButton()
            : null,
      ),
      body: ListView.builder(
        itemCount: climbs.length,
        prototypeItem: ListTile(
          // not sure what prototypeItem does
          title: Text(climbs.first.name),
        ),
        itemBuilder: (context, index) {
          // here we need to take from the item list, which should eventually be
          // a list of climb objects
          // climb containing name, grade, angle, hands[], feet[], start, fin
          // maybe a couple more variables
          return ListTile(
            leading: Image(
                image: AssetImage(('assets/${climbs[index].grade.name}.png'))),
            // leading: Image(image: AssetImage('assets/${climbs[index]}.png')),
            title: Text(climbs[index].name),
            trailing: Text('${climbs[index].angle}°'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ClimbScreen(climb: climbs[index])),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddClimbScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
      endDrawer: const DrawerScreen(),
    );
  }
}
