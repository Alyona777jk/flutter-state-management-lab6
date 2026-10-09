import 'package:flutter/material.dart';
import '../state/counter_scope.dart';

class HistoryBadge extends StatelessWidget {
  const HistoryBadge({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('build: HistoryBadge');
    final count = CounterScope.of(context).history.length;

    return Badge(
      label: Text('$count'),
      child: const Icon(Icons.history),
    );
  }
}
