import 'package:flutter/material.dart';

import '../Classes/board.dart';
import 'ClimbScreen.dart';

class BoardScreen extends StatelessWidget {
  const BoardScreen({super.key, required this.board});

  final Board board;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Board Screen'),
        leading: (ModalRoute.of(context)?.canPop ?? false)
            ? const BackButton()
            : null,
      ),
      body: ListView.builder(
        itemCount: board.climbs.length,
        prototypeItem: ListTile(
          // not sure what prototypeItem does
          title: Text(board.climbs.first.name),
        ),
        itemBuilder: (context, index) {
          // here we need to take from the item list, which should eventually be
          // a list of climb objects
          // climb containing name, grade, angle, hands[], feet[], start, fin
          // maybe a couple more variables
          return ListTile(
            leading: Image(
                image: AssetImage('assets/${board.climbs[index].grade}.png')),
            title: Text(board.climbs[index].name),
            trailing:
                Image(image: AssetImage('assets/${board.climbs[index].path}')),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ClimbScreen(climb: board.climbs[index])),
              );
            },
          );
        },
      ),
      endDrawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
