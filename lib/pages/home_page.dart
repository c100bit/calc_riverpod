import 'package:calc_riverpod/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/tasks_provider.dart';
import '../widgets/arithmetic_view.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.read(tasksProvider);

    return Scaffold(
        appBar: const MyAppBar(),
        body: Center(child: ArithmeticView(tasks: tasks)));
  }
}
