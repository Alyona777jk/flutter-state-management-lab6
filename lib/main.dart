import 'package:flutter/material.dart';
import 'state/counter_notifier.dart';
import 'state/counter_scope.dart';
import 'screens/counter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterNotifier _counterNotifier = CounterNotifier();

  @override
  void dispose() {
    _counterNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CounterScope(
      notifier: _counterNotifier,
      child: MaterialApp(
        title: 'Counter App',
        theme: ThemeData(useMaterial3: true),
        home: const CounterScreen(),
      ),
    );
  }
}
