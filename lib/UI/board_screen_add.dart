// pulled from https://docs.flutter.dev/cookbook/navigation/navigation-basics
// https://api.flutter.dev/flutter/material/DropdownButton-class.html
// https://www.waldo.com/blog/flutter-enum
import 'package:flutter/material.dart';
import 'package:splatter_board/Classes/board_type.dart';

import 'drawer_m.dart';

class AddBoardScreen extends StatelessWidget {
  const AddBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Board Screen'),
        leading: (ModalRoute.of(context)?.canPop ?? false)
            ? const BackButton()
            : null,
      ),
      body: const BoardForm(),
      // bottomNavigationBar: const BottomNavigationBarM(),
      endDrawer: const DrawerScreen(),
    );
  }
}

class BoardForm extends StatefulWidget {
  const BoardForm({Key? key}) : super(key: key);

  @override
  State<BoardForm> createState() => _BoardFormState();
}

class _BoardFormState extends State<BoardForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  BoardType? dropdownValue = BoardType.splatter;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          /*
          String name;
  BoardType type;
        */
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your board name',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          DropdownButtonFormField(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            // underline: Container(
            //   height: 2,
            //   color: Colors.deepPurpleAccent,
            // ),
            onChanged: (BoardType? newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: BoardType.values.map((BoardType type) {
              return DropdownMenuItem(
                value: type,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                      child:
                          Image(image: AssetImage('assets/${type.name}.png')),
                    ),
                    Text(type.name)
                  ],
                ),
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  // Process data.
                }
              },
              child: const Text('Save'),
            ),
          ),
        ],
      ),
    );
  }
}
