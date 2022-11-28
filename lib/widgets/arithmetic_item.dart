import 'package:calc_riverpod/models/arithmetic_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ArithmeticItem extends StatelessWidget {
  final ArithmeticTask task;

  const ArithmeticItem({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('${task.operand1} ${task.operator} ${task.operand2} = '),
        SizedBox(
            width: 30,
            child: TextField(
              onChanged: (value) => {},
              keyboardType: TextInputType.number,
              maxLength: 3,
              decoration: const InputDecoration(counterText: ""),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ))
      ],
    );
  }
}
