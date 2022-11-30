import 'package:calc_riverpod/providers/name_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/tasks_provider.dart';
import '../widgets/app_card.dart';

class StartPage extends ConsumerWidget {
  StartPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _focusNode = FocusNode();

  void onPressed(BuildContext context, WidgetRef ref) {
    _formKey.currentState!.validate()
        ? Navigator.of(context).pushReplacementNamed('/home')
        : _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameNotifier = ref.read(nameProvider.notifier);
    final tasksCount = ref.read(tasksProvider).length;

    return Scaffold(
        body: Form(
            key: _formKey,
            child: AppCard(
                btnTitle: 'Начать',
                onPressed: () => onPressed(context, ref),
                height: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Необходимо решить $tasksCount примеров.\n'
                      'Запустится таймер.\n'
                      'Можно использовать клавишу Enter\n',
                      style: const TextStyle(fontSize: 20, height: 1.5),
                      textAlign: TextAlign.center,
                    ),
                    TextFormField(
                      autofocus: true,
                      focusNode: _focusNode,
                      onChanged: (value) =>
                          nameNotifier.update((state) => value),
                      onFieldSubmitted: (_) => onPressed(context, ref),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Введите имя';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          counterText: '', helperText: 'Введите имя'),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ))));
  }
}
