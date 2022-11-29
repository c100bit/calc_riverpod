import 'package:calc_riverpod/widgets/app_button.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        SizedBox(
          width: 450,
          child: Text(
            'Для решения примеров нажмите на кнопку.\n Запустится таймер',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 50),
        AppButton(title: 'Начать'),
      ],
    )));
  }
}
