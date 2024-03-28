import 'package:femmecare/presentations/dashboard.dart';
import 'package:flutter/material.dart';

class Channel extends StatelessWidget {
  const Channel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Channel'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the previous route
            // Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Calendar()), // Assuming Dashboard is the widget for dashboard.dart
            );
          },
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Healthy Diet',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink.withOpacity(.8),
                        ),
                      ),
                      const Text(
                        'Monday, June 8',
                        style: TextStyle(color: Colors.pink, fontSize: 17),
                      ),
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/Login.png'),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 1,
                        top: 1,
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 12, 113, 15),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 5),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(color: Colors.white.withOpacity(.3))),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    'assets/Login.png',
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 12, top: 24, bottom: 13),
                    child: Text(
                      'Top Stories Top StoriesTop StoriesTop Stories',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(.8),
                      ),
                    ),
                  ),
                  const ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/Logo.png'),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Hossin El ghazli',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Text(
                          '31m ago',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      'sdfsdfsdfsdfsdfsf sdfsfsdfsdfsdfsdfsdf sfdsfdsfsdfdsfss  sfdsfdsfsdfsfdsdfsdfsdfsdfsdfsf sdfsfsdfsdfsdfsdfsdf sfdsfdsfsdfdsfss  sfdsfdsfsdfsfd',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            SizedBox(width: 4),
                            Text(
                              "231",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(width: 24),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.comment,
                            ),
                            SizedBox(width: 4),
                            Text(
                              "231",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
