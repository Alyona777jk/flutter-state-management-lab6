import 'package:flutter/material.dart';
import '../state/counter_scope.dart';
import '../widgets/counter_value_text.dart';
import '../widgets/history_badge.dart';
import 'history_screen.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _selectedStep = 1;

  @override
  Widget build(BuildContext context) {
    debugPrint('build: CounterScreen');
    final notifier = CounterScope.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Лічильник'),
        actions: [
          IconButton(
            icon: const HistoryBadge(),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const HistoryScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CounterValueText(),
            if (notifier.errorMessage != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  notifier.errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            const SizedBox(height: 20),
            SegmentedButton<int>(
              segments: const [
                ButtonSegment(value: 1, label: Text('1')),
                ButtonSegment(value: 5, label: Text('5')),
                ButtonSegment(value: 10, label: Text('10')),
              ],
              selected: {_selectedStep},
              onSelectionChanged: (newSelection) {
                setState(() {
                  _selectedStep = newSelection.first;
                });
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => notifier.decrement(_selectedStep),
                  child: const Text('-'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => notifier.reset(),
                  child: const Text('Скинути'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => notifier.increment(_selectedStep),
                  child: const Text('+'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
