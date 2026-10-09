import 'package:flutter/widgets.dart';
import 'counter_notifier.dart';

class CounterScope extends InheritedNotifier<CounterNotifier> {
  const CounterScope({
    super.key,
    required CounterNotifier notifier,
    required super.child,
  }) : super(notifier: notifier);

  static CounterNotifier of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<CounterScope>();
    assert(scope != null, 'No CounterScope found in context');
    return scope!.notifier!;
  }
}
