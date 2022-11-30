import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final void Function() onPressed;

  const AppButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 20),
        ));
  }
}
