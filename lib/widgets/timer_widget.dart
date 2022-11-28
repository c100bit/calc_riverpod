import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/timer_provider.dart';

class TimerWidget extends ConsumerWidget {
  const TimerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timer = ref.watch(timerProvider);
    return timer.when(
        data: (data) => Text(data),
        loading: () => const Text('00:00'),
        error: (err, trace) => const Text('00:00'));
  }
}
