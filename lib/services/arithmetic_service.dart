import 'dart:math' as math;

import '../models/arithmetic_task.dart';

class ArithmeticService {
  final _random = math.Random();
  final _operators = ['+', '-', '*'];

  final int min;
  final int max;
  final int multMax;

  ArithmeticService({
    this.min = 1,
    this.max = 15,
    this.multMax = 9,
  });

  List<ArithmeticTask> generate([int count = 100]) =>
      List<ArithmeticTask>.generate(count, (index) => _generateItem(index));

  ArithmeticTask _generateItem(int id) {
    final operator = _randomOperator();
    final maxRange = operator == '*' ? multMax : max;
    final operands = [_randomNumber(maxRange), _randomNumber(maxRange)];
    final operand1 = math.max(operands[0], operands[1]);
    final operand2 = math.min(operands[0], operands[1]);

    final result = _calcResult(operand1, operand2, operator);

    return ArithmeticTask(
      id: id,
      operand1: operand1,
      operand2: operand2,
      operator: operator,
      result: result,
    );
  }

  int _randomNumber(int maxRange) => min + _random.nextInt(maxRange - min);
  String _randomOperator() => _operators[_random.nextInt(_operators.length)];

  int _calcResult(int n1, int n2, String op) {
    switch (op) {
      case '+':
        return n1 + n2;
      case '-':
        return n1 - n2;
      case '*':
        return n1 * n2;
      default:
        return 0;
    }
  }
}
