import 'package:flutter/material.dart';

import 'app_button.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final String btnTitle;
  final double height;
  final void Function() onPressed;

  const AppCard({
    Key? key,
    required this.child,
    required this.onPressed,
    required this.btnTitle,
    this.height = 400,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 500,
        height: height,
        child: Card(
            child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                child,
                const SizedBox(height: 30),
                AppButton(title: btnTitle, onPressed: onPressed),
              ]),
        )),
      ),
    );
  }
}
