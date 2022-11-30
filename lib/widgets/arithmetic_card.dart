import 'package:calc_riverpod/models/arithmetic_task.dart';
import 'package:calc_riverpod/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_card.dart';

class ArithmeticCard extends StatelessWidget {
  final ArithmeticTask task;
  final void Function() onPressed;
  final _formKey = GlobalKey<FormState>();
  final _focusNode = FocusNode();

  ArithmeticCard({
    Key? key,
    required this.task,
    required this.onPressed,
  }) : super(key: key);

  void nextTask() => _formKey.currentState!.validate()
      ? onPressed()
      : _focusNode.requestFocus();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: AppCard(
        btnTitle: 'Продолжить',
        onPressed: nextTask,
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${task.operand1} ${task.operator} ${task.operand2} = ',
                  style: const TextStyle(fontSize: 60),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 33.0),
                  child: SizedBox(
                      width: 105,
                      height: 120,
                      child: TextFormField(
                        autofocus: true,
                        focusNode: _focusNode,
                        onFieldSubmitted: (_) => nextTask(),
                        validator: (value) {
                          if (value != '${task.result}') {
                            return 'Неверно';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(counterText: ''),
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        style: const TextStyle(fontSize: 60),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
