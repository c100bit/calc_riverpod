import 'dart:math';

import 'package:calc_riverpod/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/arithmetic_provider.dart';
import '../widgets/arithmetic_item.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.read(arithmeticProvider).generate();

    return Scaffold(
        appBar: const MyAppBar(),
        body: LayoutBuilder(
          builder: (context, constraints) => CustomScrollView(
            slivers: [
              SliverPadding(
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 2, crossAxisCount: 7),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) =>
                          ArithmeticItem(task: tasks[index]),
                      childCount: tasks.length,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: max((constraints.maxWidth - 1200) / 2, 0) > 15
                        ? max((constraints.maxWidth - 1200) / 2, 0)
                        : 15,
                  ))
            ],
          ),
        ));
  }
}
