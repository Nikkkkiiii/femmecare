import 'package:femmecare/presentations/calendar/calendarState.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';

class Calendars extends StatefulWidget {
  const Calendars({Key? key}) : super(key: key);

  @override
  _CalendarsState createState() => _CalendarsState();
}

class _CalendarsState extends State<Calendars> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalendarState(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Calendar",
              style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: Consumer<CalendarState>(
          builder: (context, calendarState, child) {
            return Column(
              children: [
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            final month = DateTime(DateTime.now().year, index + 1);
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 10.0),
                              child: Column(
                                children: [
                                  TableCalendar(
                                    focusedDay: month,
                                    firstDay: DateTime(1990),
                                    lastDay: DateTime(2050),
                                    calendarFormat: calendarState.format,
                                    onFormatChanged: (CalendarFormat format) {
                                      setState(() {
                                        calendarState.format = format;
                                      });
                                    },
                                    startingDayOfWeek: StartingDayOfWeek.sunday,
                                    daysOfWeekVisible: true,
                                    onDaySelected: (DateTime selectDay, DateTime focusDay) {
                                      calendarState.selectDay(selectDay, focusDay);
                                      print(focusDay);
                                    },
                                    selectedDayPredicate: (DateTime date) {
                                      return isSameDay(calendarState.selectedDay, date);
                                    },
                                    calendarStyle: const CalendarStyle(
                                      isTodayHighlighted: true,
                                      selectedDecoration: BoxDecoration(
                                        color: Color.fromARGB(255, 255, 95, 148),
                                        shape: BoxShape.circle,
                                      ),
                                      todayDecoration: BoxDecoration(
                                        color: Color.fromARGB(255, 255, 31, 105),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    headerStyle: const HeaderStyle(
                                      formatButtonVisible: false,
                                      titleCentered: true,
                                      formatButtonShowsNext: true,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          childCount: 12, // Displaying 12 months
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    calendarState.addPeriodDate();
                  },
                  child: Text('Add Period Date'),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: calendarState.periodDates.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(calendarState.periodDates[index].toString()),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }
}
