import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/arithmetic_service.dart';

final tasksProvider = Provider((ref) => ArithmeticService().generate());
final currentTaskProvider = StateProvider<int>((ref) => 0);
