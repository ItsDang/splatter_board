// https://stackoverflow.com/questions/51659805/persisting-appbar-drawer-across-all-pages-flutter
// https://blog.logrocket.com/how-to-build-a-bottom-navigation-bar-in-flutter/
// may not use
import 'package:flutter/material.dart';

class BottomNavigationBarM extends StatelessWidget {
  const BottomNavigationBarM({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.cancel),
          label: 'Cancel',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.save),
          label: 'Save',
        ),
      ],
    );
  }
}
