import 'package:femmecare/presentations/calendar.dart';
import 'package:femmecare/presentations/chatList.dart';
import 'package:femmecare/presentations/map_page.dart';
import 'package:femmecare/presentations/notification.dart';
import 'package:femmecare/presentations/profile.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:url_launcher/url_launcher.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MapPage()),
      );
    }
    // Navigate to the profile page if the profile icon is tapped (index 1)
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    }
    // Navigate to the profile page if the profile icon is tapped (index 1)
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NotificationPage()),
      );
    }
    // Navigate to the profile page if the profile icon is tapped (index 1)
    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Messages()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text("Hi Nikki"),
        
        leading: Container(
            padding:  const EdgeInsets.all(15.0),
            // width: 5.0,
            // height: 5.0,
            decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              shape: BoxShape.circle, // Use BoxShape.circle for circular shape
              border: Border.all(
                color: Colors.white,
                width: 1.0,
              ),
            ),
            // child: Icon(Icons.person, color: Colors.white),
            ),
        // centerTitle: false,
       
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Calendars()),
              );
            },
            child: TableCalendar(
              focusedDay: DateTime.now(),
              firstDay: DateTime.now().subtract(
                  const Duration(days: 1)), // Display one day before today
              lastDay: DateTime.now()
                  .add(const Duration(days: 1)), // Display one day after today
              calendarFormat:
                  CalendarFormat.week, // Set calendar format to week
              onFormatChanged: (CalendarFormat format) {
                setState(() {
                  format = format;
                });
              },
              startingDayOfWeek: StartingDayOfWeek.sunday,
              daysOfWeekVisible: true,
              //Day changed
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                setState(() {
                  selectedDay = selectDay;
                  focusedDay = focusDay;
                });
                print(focusedDay);
              },
              selectedDayPredicate: (DateTime date) {
                return isSameDay(selectedDay, date);
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
              ),
            ),
          ),
          const SizedBox(height: 30,),
          // const EmergencyButton(),
          Center(
            child: Container(
            width: 200, // Adjust the width and height as needed
            height: 200,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 82, 139), // Pink color for the circle
              shape: BoxShape.circle,
            ),
            child: ElevatedButton(
              onPressed: () {
                launchUrl(Uri.parse('sms:9807956872'));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent, // Transparent background for the button
                elevation: 0, // No shadow for the button
              ),
              child: Text(
                'Press Me',
                style: TextStyle(
                  color: Colors.white, // White color for the text
                  fontFamily: 'Poppins', // Poppins font style
                  fontSize: 20, // Adjust the font size as needed
                ),
              ),
            ),
          ),
          ),
          CategoriesScroller(),
          // const MyHomePage(launchUrl: launchUrl)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orangeAccent,
        unselectedItemColor: Colors.black87,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Google Map',
            activeIcon: Icon(Icons.map),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            activeIcon: Icon(Icons.person),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active),
            label: 'Notification',
            activeIcon: Icon(Icons.notifications_active),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
        ],
      ),
    );
  }
}


class CategoriesScroller extends StatelessWidget {
  CategoriesScroller();

  @override
  Widget build(BuildContext context) {
    final double categoryHeight =
        MediaQuery.of(context).size.height * 0.30 - 50;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10,),
        const Padding(
          padding:  EdgeInsets.only(left: 20, top: 20),
          child: Text(
            'Channel',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 24,
              color: Colors.pink,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: FittedBox(
              alignment: Alignment.topCenter,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 150,
                    margin: const EdgeInsets.only(right: 20),
                    height: categoryHeight,
                    decoration: BoxDecoration(
                        color: Colors.orange.shade400,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0))),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/chan');
                        },
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Hygienic\nFood",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.pink,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "20 Items",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    margin: const EdgeInsets.only(right: 20),
                    height: categoryHeight,
                    decoration: BoxDecoration(
                        color: Colors.blue.shade400,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0))),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Newest",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.pink,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "20 Items",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    margin: const EdgeInsets.only(right: 20),
                    height: categoryHeight,
                    decoration: BoxDecoration(
                        color: Colors.blue.shade400,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0))),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Newest",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.pink,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "20 Items",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    margin: const EdgeInsets.only(right: 20),
                    height: categoryHeight,
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent.shade400,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0))),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Super\nSaving",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "20 Items",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
