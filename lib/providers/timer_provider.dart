import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/utils.dart';

final timerProvider = StreamProvider<String>((ref) {
  return AppTimer().timer;
});

class AppTimer {
  late final Timer _timer;
  final _timerCtrl = StreamController<String>();

  AppTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final time = Utils.intToTime(timer.tick);
      _timerCtrl.add(time);
    });
  }

  Stream<String> get timer => _timerCtrl.stream;

  dispose() {
    _timer.cancel();
    _timerCtrl.close();
  }
}
