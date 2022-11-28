import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/arithmetic_service.dart';

final arithmeticProvider = Provider((ref) => ArithmeticService());
