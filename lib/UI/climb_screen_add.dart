// pulled from https://docs.flutter.dev/cookbook/navigation/navigation-basics
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splatter_board/Classes/grades.dart';

import 'drawer_m.dart';

class AddClimbScreen extends StatelessWidget {
  const AddClimbScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Climb Screen'),
        leading: (ModalRoute.of(context)?.canPop ?? false)
            ? const BackButton()
            : null,
      ),
      body: const ClimbForm(),
      // bottomNavigationBar: const BottomNavigationBarM(),
      endDrawer: const DrawerScreen(),
    );
  }
}

class ClimbForm extends StatefulWidget {
  const ClimbForm({Key? key}) : super(key: key);

  @override
  State<ClimbForm> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<ClimbForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Grades? grade = Grades.vIntro;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          /*
            String path;
  String name;
  String grade;
  int angle;
  */
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your climb name',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          DropdownButtonFormField(
            value: grade,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            // underline: Container(
            //   height: 2,
            //   color: Colors.deepPurpleAccent,
            // ),
            onChanged: (Grades? newValue) {
              setState(() {
                grade = newValue;
              });
            },
            items: Grades.values.map((Grades grade) {
              return DropdownMenuItem(
                value: grade,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                      child:
                          Image(image: AssetImage('assets/${grade.name}.png')),
                    ),
                    Text(grade.name)
                  ],
                ),
              );
            }).toList(),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: 'Enter your climb angle',
            ),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ], // Only numbers can be entered
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              } else {
                final n = num.tryParse(value);
                if (n == null) {
                  return 'Please enter a number';
                }
                if (n < 0 || n > 90) {
                  return 'Please enter an angle between 0 and 90';
                }
                return null;
              }
            },
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
