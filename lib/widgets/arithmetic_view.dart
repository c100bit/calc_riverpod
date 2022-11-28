import 'package:calc_riverpod/models/arithmetic_task.dart';
import 'package:calc_riverpod/providers/tasks_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'arithmetic_card.dart';

class ArithmeticView extends ConsumerWidget {
  final List<ArithmeticTask> tasks;
  const ArithmeticView({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskIdx = ref.watch(currentTaskProvider);
    final taskIdxNotifier = ref.read(currentTaskProvider.notifier);

    final task = tasks[taskIdx];

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(scale: animation, child: child);
      },
      child: ArithmeticCard(
        key: ValueKey(task.id),
        task: task,
        onPressed: () => taskIdx < tasks.length - 1
            ? taskIdxNotifier.state++
            : Navigator.of(context).pushNamedAndRemoveUntil(
                '/finish', (Route<dynamic> route) => false),
      ),
    );
  }
}
