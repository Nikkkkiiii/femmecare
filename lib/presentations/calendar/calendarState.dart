import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarState with ChangeNotifier {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  List<DateTime> periodDates = [];

  void selectDay(DateTime selectedDay, DateTime focusedDay) {
    this.selectedDay = selectedDay;
    this.focusedDay = focusedDay;
    notifyListeners();
  }

  void addPeriodDate() {
    DateTime normalizedDate = DateTime(selectedDay.year, selectedDay.month, selectedDay.day);
    if (!periodDates.any((d) => isSameDay(d, normalizedDate))) {
      periodDates.add(normalizedDate);
      // Calculate the next focused day
      focusedDay = normalizedDate.add(Duration(days: 28));
      notifyListeners();
    }
  }
}
