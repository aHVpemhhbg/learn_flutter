import 'package:flutter/material.dart';
import 'package:learn_flutter/pages/simple_form_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SimpleForm(),
        // child: Column(
      // children: const [
        // const SizedBox(height: 12),
        // ElevatedButton(
        //   onPressed: () {
        //     Navigator.of(context).push(
        //       MaterialPageRoute(builder: (BuildContext context) {
        //         return const LearnFlutterPage();
        //       }),
        //     );
        //   },
        //   child: const Text('Learn Flutter'),
        // ),
        // ElevatedButton(
        //     onPressed: () {
        //       Navigator.of(context).push(
        //         MaterialPageRoute(builder: (BuildContext context) {
        //           return const SimpleForm();
        //         }),
        //       );
        //     },
        //     child: const Text('Stenbok Simple Form Test'))
      // ],
    // ),
    );
  }
}
