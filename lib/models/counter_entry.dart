import 'package:flutter/foundation.dart';

@immutable
class CounterEntry {
  final DateTime timestamp;
  final String action;
  final int valueBefore;
  final int valueAfter;

  const CounterEntry({
    required this.timestamp,
    required this.action,
    required this.valueBefore,
    required this.valueAfter,
  });
}
