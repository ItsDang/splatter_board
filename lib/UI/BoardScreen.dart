import 'package:flutter/material.dart';

import '../Classes/board.dart';
import 'ClimbScreen.dart';
import 'DrawerScreen.dart';

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
      endDrawer: const DrawerScreen(),
    );
  }
}
