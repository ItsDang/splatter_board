// https://stackoverflow.com/questions/51659805/persisting-appbar-drawer-across-all-pages-flutter
import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        // child: ListView(
        //   // Important: Remove any padding from the ListView.
        //   padding: EdgeInsets.zero,
        //   children: [
        //     const DrawerHeader(
        //       decoration: BoxDecoration(
        //         color: Colors.blue,
        //       ),
        //       child: Text('Drawer Header'),
        //     ),
        //     ListTile(
        //       title: const Text('Item 1'),
        //       onTap: () {
        //         // Update the state of the app
        //         // ...
        //         // Then close the drawer
        //         Navigator.pop(context);
        //       },
        //     ),
        //     ListTile(
        //       title: const Text('Item 2'),
        //       onTap: () {
        //         // Update the state of the app
        //         // ...
        //         // Then close the drawer
        //         Navigator.pop(context);
        //       },
        //     ),
        //   ],
        // ),
        );
  }
}
