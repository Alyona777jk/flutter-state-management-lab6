import 'package:flutter/material.dart';
import '../state/counter_scope.dart';
import '../widgets/history_badge.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('build: HistoryScreen');
    final notifier = CounterScope.of(context);
    final history = notifier.history;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Історія'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: HistoryBadge(),
          ),
        ],
      ),
      body: history.isEmpty
          ? const Center(child: Text('Історія порожня'))
          : ListView.builder(
              itemCount: history.length,
              itemBuilder: (context, index) {
                final entry = history[index];
                return ListTile(
                  title: Text('${entry.action}: ${entry.valueBefore} → ${entry.valueAfter}'),
                  subtitle: Text(entry.timestamp.toString()),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: history.isEmpty ? null : () => notifier.clearHistory(),
        child: const Icon(Icons.delete),
      ),
    );
  }
}
