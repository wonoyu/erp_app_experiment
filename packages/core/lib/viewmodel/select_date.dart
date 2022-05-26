import 'package:core/constants/app_constants.dart';
import 'package:flutter/material.dart';

class SelectDate with ChangeNotifier {
  DateTimeRange _dateTime = DateTimeRange(start: TimeConstants.today, end: TimeConstants.endToday);
  DateTimeRange get dateTime => _dateTime;

  void selectDateTimeRange(DateTimeRange dateTimeRange) {
    _dateTime = dateTimeRange;
    notifyListeners();
  }
}