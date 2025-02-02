import 'package:flutter/material.dart';
import 'package:language_learning/data/endpoint/auth/timing_endpoint.dart';

import '../model/time_interval.dart';

class TimingProvider with ChangeNotifier {
  final List<TimeInterval> intervals = [
    TimeInterval(id: 1, title: '15min'),
    TimeInterval(id: 2, title: '30min'),
    TimeInterval(id: 3, title: '1 hour'),
  ];

  int? _selectedIntervalId;
  bool _isIntervalSelected = false;
  String _userId = '';

  DateTime? _startTime;
  DateTime? _endTime;

  int? get selectedIntervalId => _selectedIntervalId;

  bool? get isIntervalSelected => _isIntervalSelected;

  String get userId => _userId;

  DateTime? get startTime => _startTime;

  DateTime? get endTime => _endTime;

  TimingInput get timingInput => TimingInput(
        intervalId: _selectedIntervalId,
        startTime: _startTime,
        endTime: _endTime,
      );

  void selectInterval(int id) {
    _selectedIntervalId = id;
    _isIntervalSelected = true;
    notifyListeners();
    print('Selected Interval ID: $id');
  }

  bool isSelectedInterval() {
    return _isIntervalSelected;
  }

  void setStartTime(DateTime time) {
    _startTime = time;
    notifyListeners();
    print('Start Time: $time');
  }

  void setEndTime(DateTime time) {
    _endTime = time;
    notifyListeners();
    print('End Time: $time');
  }
}
