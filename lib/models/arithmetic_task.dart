import 'package:flutter/foundation.dart';

@immutable
class ArithmeticTask {
  final int id;
  final int operand1;
  final int operand2;
  final String operator;
  final int result;

  const ArithmeticTask({
    required this.id,
    required this.operand1,
    required this.operand2,
    required this.operator,
    required this.result,
  });

  @override
  String toString() => '$operand1 $operator $operand2 = $result';
}
