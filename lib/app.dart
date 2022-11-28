import 'package:calc_riverpod/pages/finish_page.dart';
import 'package:calc_riverpod/pages/home_page.dart';
import 'package:calc_riverpod/pages/start_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calc',
      routes: {
        '/start': (context) => const StartPage(),
        '/home': (context) => const HomePage(),
        '/finish': (context) => const FinishPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StartPage(),
    );
  }
}
