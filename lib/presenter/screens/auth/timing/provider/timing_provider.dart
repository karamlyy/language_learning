import 'package:flutter/material.dart';

import '../model/time_interval.dart';

class TimingProvider with ChangeNotifier {
  final List<TimeInterval> intervals = [
    TimeInterval(id: 0, title: '15min'),
    TimeInterval(id: 1, title: '30min'),
    TimeInterval(id: 2, title: '1 hour'),
  ];

  int? _selectedIntervalId;
  bool _isIntervalSelected = false;

  String? _startTime;
  String? _endTime;

  int? get selectedIntervalId => _selectedIntervalId;
  bool? get isIntervalSelected => _isIntervalSelected;

  String? get startTime => _startTime;

  String? get endTime => _endTime;

  void selectInterval(int id) {
    _selectedIntervalId = id;
    _isIntervalSelected = true;
    notifyListeners();
    print('Selected Interval ID: $id');
  }

  bool isSelectedInterval(){
    return _isIntervalSelected;
  }


  void setStartTime(String time) {
    _startTime = time;
    notifyListeners();
    print('Start Time: $time');
  }

  void setEndTime(String time) {
    _endTime = time;
    notifyListeners();
    print('End Time: $time');
  }
}
