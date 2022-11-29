import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;

  const AppButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => Navigator.of(context)
            .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false),
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 20),
        ));
  }
}
