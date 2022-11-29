import 'package:calc_riverpod/models/arithmetic_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ArithmeticCard extends StatelessWidget {
  final ArithmeticTask task;
  final void Function() onPressed;
  final _formKey = GlobalKey<FormState>();

  ArithmeticCard({
    Key? key,
    required this.task,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Card(
        child: SizedBox(
          width: 500,
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
              const SizedBox(height: 15),
              ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                ),
                onPressed: () =>
                    _formKey.currentState!.validate() ? onPressed() : null,
                child: const Text(
                  'Продолжить',
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
