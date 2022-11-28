import '../widgets/start_button.dart';

import 'package:flutter/material.dart';

class FinishPage extends StatelessWidget {
  const FinishPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Ваши результаты:',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 50),
          StartButton(),
        ],
      ),
    ));
  }
}
