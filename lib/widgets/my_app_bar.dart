import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'timer_widget.dart';

class MyAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      centerTitle: true,
      title: const TimerWidget(),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
                '/finish', (Route<dynamic> route) => false),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 20)),
            ),
            child: const Text(
              'Завершить',
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
