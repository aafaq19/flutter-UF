import 'package:application_unique_force/activity_page.dart';
import 'package:application_unique_force/breakinout_page.dart';
import 'package:application_unique_force/chat_page.dart';
import 'package:application_unique_force/check_attendance.dart';
import 'package:application_unique_force/demo_00.dart';
import 'package:application_unique_force/domain_skillpage.dart';
import 'package:application_unique_force/editprofile_page.dart';
import 'package:application_unique_force/fingerprint_page.dart';
import 'package:application_unique_force/login_attendance.dart';
import 'package:application_unique_force/logout_page.dart';
import 'package:application_unique_force/notification_page.dart';
import 'package:application_unique_force/passcode_page.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _pageIndex = 1;
  final List<Widget> _pages = [
    const EditProfilePage(),
    const CheckAttendance(),
    const ActivityPage(),
    const ChatbotScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(230, 255, 239, 223),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AppDrawer()),
            );
          },
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center, // Add this line
          children: [
            Text(
              'Unique',
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(
                width: 10), // Reduce the width to make it look more centered
            Text(
              'Force',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationPage()),
              );
            },
          ),
        ],
      ),
      body: _pages[_pageIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: const Color.fromARGB(230, 242, 166, 90),
        buttonBackgroundColor: const Color.fromARGB(230, 242, 166, 90),
        height: 60,
        items: <Widget>[
          const Icon(Icons.person, size: 30, color: Colors.white),
          const Icon(Icons.house_rounded, size: 30, color: Colors.white),
          const Icon(Icons.calendar_today, size: 30, color: Colors.white),
          Image.asset(
            'assets/Chat_icon.jpg',
            height: 40,
            width: 40,
          ),
        ],
        animationDuration: const Duration(milliseconds: 200),
        index: _pageIndex,
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
    );
  }
}
