import 'package:flutter/material.dart';

import '../Classes/board.dart';
import 'board_screen_add.dart';
import 'climbs_screen.dart';
import 'drawer_m.dart';

class BoardsScreen extends StatelessWidget {
  const BoardsScreen({super.key, required this.boards});

  final List<Board> boards;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Boards'),
        leading: (ModalRoute.of(context)?.canPop ?? false)
            ? const BackButton()
            : null,
      ),
      body: ListView.builder(
        itemCount: boards.length,
        prototypeItem: ListTile(
          // not sure what prototypeItem does
          title: Text(boards.first.name),
        ),
        itemBuilder: (context, index) {
          // here we need to take from the item list, which should eventually be
          // a list of climb objects
          // climb containing name, grade, angle, hands[], feet[], start, fin
          // maybe a couple more variables
          return ListTile(
            leading: SizedBox(
              width: 20,
              child: Image(
                  image: AssetImage('assets/${boards[index].type.name}.png')),
            ),
            title: Text(boards[index].name),
            trailing: Text('${boards[index].climbs.length}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ClimbsScreen(climbs: boards[index].climbs)),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddBoardScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
      endDrawer: const DrawerScreen(),
    );
  }
}
