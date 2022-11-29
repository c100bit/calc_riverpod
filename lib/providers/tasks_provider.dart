import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/arithmetic_service.dart';

final tasksServiceProvider = Provider((ref) => ArithmeticService());
final tasksProvider =
    Provider.autoDispose((ref) => ref.read(tasksServiceProvider).generate(5));
final currentTaskProvider = StateProvider.autoDispose<int>((ref) => 0);
