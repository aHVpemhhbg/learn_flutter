import 'package:flutter/material.dart';

class NetworkService {
  static Future postData(BuildContext context) async {
    return await Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pop(true);

      showDialog(
          context: context,
          builder: (BuildContext buildContext) {
            return AlertDialog(
              title: const Text("Email Sent"),
              content: const Text(
                  "Email is successfully sent, please check your inbox for the form details"),
              actions: [
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(buildContext).textTheme.labelLarge,
                  ),
                  child: const Text('Disable'),
                  onPressed: () {
                    Navigator.of(buildContext).pop();
                  },
                ),
              ],
            );
          });
    });
  }
}
