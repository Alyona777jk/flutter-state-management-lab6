import 'package:flutter/foundation.dart';
import '../models/counter_entry.dart';

class CounterNotifier extends ChangeNotifier {
  int _value = 0;
  final List<CounterEntry> _history = [];
  String? _errorMessage;

  int get value => _value;
  List<CounterEntry> get history => List.unmodifiable(_history);
  String? get errorMessage => _errorMessage;

  void increment(int step) {
    final before = _value;
    _value += step;
    _errorMessage = null;
    _addEntry('Додавання (+$step)', before, _value);
    notifyListeners();
  }

  void decrement(int step) {
    if (_value - step < 0) {
      _errorMessage = 'Значення не може бути від\'ємним!';
      notifyListeners();
      return;
    }
    final before = _value;
    _value -= step;
    _errorMessage = null;
    _addEntry('Віднімання (-$step)', before, _value);
    notifyListeners();
  }

  void reset() {
    final before = _value;
    _value = 0;
    _errorMessage = null;
    _addEntry('Скидання', before, 0);
    notifyListeners();
  }

  void clearHistory() {
    _history.clear();
    notifyListeners();
  }

  void _addEntry(String action, int before, int after) {
    _history.insert(
      0,
      CounterEntry(
        timestamp: DateTime.now(),
        action: action,
        valueBefore: before,
        valueAfter: after,
      ),
    );
  }
}
