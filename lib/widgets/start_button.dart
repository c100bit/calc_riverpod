import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  const StartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => Navigator.of(context)
            .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false),
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
        ),
        child: const Text(
          'Начать',
          style: TextStyle(fontSize: 20),
        ));
  }
}
