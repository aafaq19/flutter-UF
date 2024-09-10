import 'package:application_unique_force/editprofile_page.dart';
import 'package:application_unique_force/skill_build.dart';
import 'package:flutter/material.dart';
import 'package:application_unique_force/company_policy.dart';
import 'package:application_unique_force/leavedashboard_page.dart';
import 'package:application_unique_force/notification_page.dart';
import 'package:application_unique_force/learn_page.dart';
import 'package:application_unique_force/work_home.dart';
import 'package:flutter/cupertino.dart';

// Entry point of the application
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Profile Icon',
      home: CheckAttendance(),
    );
  }
}

// Main class to display the attendance check screen
class CheckAttendance extends StatelessWidget {
  const CheckAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            buildCard(
                'Work From Home', 'Remote Comfort', Icons.home_work, 'WFH', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const WorkFromHomePage()),
              );
            }),
            buildCard(
                'Company Policy', 'Follow the Rules', Icons.policy, 'Policy ',
                () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const company()),
              );
            }),
            buildCardWithImage(
                'Learn',
                'Build Your Career',
                Image.asset(
                  'assets/l1.png',
                  height: 40,
                  width: 40,
                ),
                'Learn', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SkillDetails()),
              );
            }),
            buildCard(
                'Skill', 'Develop your skills', Icons.school_sharp, 'Skill',
                () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SkillBuild()),
              );
            }),
            buildCard('Leave Request', '', Icons.directions_walk_sharp, 'Leave',
                () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LeaveDashboardPage()),
              );
            }),
            buildCard('Total Days in a Year ', '261 Working Days',
                Icons.calendar_today, '', null),
            buildCard('Total Leave in a Year', '24 Days', Icons.beach_access,
                '', null),
            buildCard('Leave Balance', '18 Days', Icons.balance, '', null),
          ],
        ),
      ),
    );
  }

  // Function to build a card with icon and navigation
  Widget buildCard(String title, String subtitle, IconData icon,
      String buttonText, VoidCallback? onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(
            230, 255, 239, 223), // Replace with your desired color
        borderRadius: BorderRadius.circular(20), // Add border radius
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30,
            color: Colors.black,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(
                  255, 10, 10, 10), // Replace with your desired color
            ),
          ),
          if (subtitle.isNotEmpty) ...[
            const SizedBox(height: 5),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 14,
                color: Color.fromARGB(
                    255, 10, 10, 10), // Replace with your desired color
              ),
            ),
          ],
          if (onPressed != null)
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      230, 243, 188, 133), // Change the color of the button
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                ),
                onPressed: onPressed,
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // New function to build a card with image and navigation
  Widget buildCardWithImage(String title, String subtitle, Widget image,
      String buttonText, VoidCallback? onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(
            230, 255, 239, 223), // Replace with your desired color
        borderRadius: BorderRadius.circular(20), // Add border radius
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image, // Use the image widget here
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(
                  255, 10, 10, 10), // Replace with your desired color
            ),
          ),
          if (subtitle.isNotEmpty) ...[
            const SizedBox(height: 5),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 14,
                color: Color.fromARGB(
                    255, 10, 10, 10), // Replace with your desired color
              ),
            ),
          ],
          if (onPressed != null)
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      230, 243, 188, 133), // Change the color of the button
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                ),
                onPressed: onPressed,
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// Dummy SkillDetailsPage for navigation example
class SkillDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Skill Details')),
      body: Center(child: Text('Details about skills here')),
    );
  }
}
