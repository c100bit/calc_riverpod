import 'package:calc_riverpod/widgets/start_button.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: StartButton()));
  }
}
