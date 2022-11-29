import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/tasks_provider.dart';
import '../providers/timer_provider.dart';
import '../widgets/app_button.dart';

import 'package:flutter/material.dart';

class FinishPage extends ConsumerWidget {
  const FinishPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.read(tasksProvider);
    final timer = ref.read(timerProvider);

    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          timer.when(
              data: (time) => Text(
                    'Ваши результаты:\n\nРешено - ${tasks.length} \nЗа - $time',
                    style: const TextStyle(fontSize: 20),
                  ),
              loading: () => const Text(''),
              error: (err, trace) => const Text('')),
          const SizedBox(height: 50),
          const AppButton(title: 'Попробовать снова'),
        ],
      ),
    ));
  }
}
