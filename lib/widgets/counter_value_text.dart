import 'package:flutter/material.dart';
import '../state/counter_scope.dart';

class CounterValueText extends StatelessWidget {
  const CounterValueText({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('build: CounterValueText');
    final value = CounterScope.of(context).value;

    return Text(
      '$value',
      style: Theme.of(context).textTheme.displayLarge,
    );
  }
}
