import 'package:flutter/material.dart';
import 'package:learn_flutter/pages/learn_flutter_page.dart';
import 'package:learn_flutter/pages/simple_form_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 20,
        child: Column(
      children: [
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) {
                return const LearnFlutterPage();
              }),
            );
          },
          child: const Text('Learn Flutter'),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return const SimpleForm();
                }),
              );
            },
            child: const Text('Stenbok Simple Form Test'))
      ],
    ));
  }
}
