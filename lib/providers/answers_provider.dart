import 'package:calc_riverpod/models/arithmetic_answer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnswersProvider extends StateNotifier<List<ArithmeticAnswer>> {
  AnswersProvider() : super([]);
}
