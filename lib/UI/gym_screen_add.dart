// pulled from https://docs.flutter.dev/cookbook/navigation/navigation-basics
// https://api.flutter.dev/flutter/widgets/Form-class.html
import 'package:flutter/material.dart';

import 'drawer_m.dart';

class AddGymScreen extends StatelessWidget {
  const AddGymScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Gym Screen'),
        leading: (ModalRoute.of(context)?.canPop ?? false)
            ? const BackButton()
            : null,
      ),
      body: const GymForm(),
      // bottomNavigationBar: const BottomNavigationBarM(),
      endDrawer: const DrawerScreen(),
    );
  }
}

class GymForm extends StatefulWidget {
  const GymForm({Key? key}) : super(key: key);

  @override
  State<GymForm> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<GymForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your gym name',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
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
