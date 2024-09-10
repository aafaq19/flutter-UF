import 'package:application_unique_force/about_us_page.dart';
import 'package:application_unique_force/fingerprint_page.dart';
import 'package:application_unique_force/login_attendance.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EmployeeAttendanceApp());
}

class EmployeeAttendanceApp extends StatelessWidget {
  const EmployeeAttendanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee Attendance App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Dashboard'),
      ),
      drawer: AppDrawer(), // Add the drawer here
      body: Center(
        child: Text('Welcome to the Employee Attendance App!'),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // Drawer Header
          const UserAccountsDrawerHeader(
            accountName: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/men.jpg'), // Replace with your profile image asset path
                ),
                SizedBox(width: 16), // add some space between image and text
                Text(
                  'Saqlain',
                  style: TextStyle(
                      fontSize: 18, // adjust the font size as needed
                      color: Color.fromARGB(255, 10, 10, 10)),
                ),
              ],
            ),
            accountEmail: Text(''),
            decoration: BoxDecoration(
              color:
                  Color.fromARGB(230, 243, 188, 133), // Header background color
            ),
          ),

          // Drawer Items
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: Text('About Us'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutUsPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text('Setting'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutUsPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.approval),
            title: Text('Approval'),
            onTap: () {
              // Handle Approval page navigation
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text('Referral'),
            onTap: () {
              // Handle Referral page navigation
              Navigator.pop(context); // Close the drawer
            },
          ),
          Divider(), // Divider line
          ListTile(
            leading: Icon(Icons.fingerprint),
            title: Text('Disable Fingerprint'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FingerprintPasscodeApp()),
              );
            },
          ),

          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
          SizedBox(
            height: 170,
          ),
          // App version at the bottom
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'version 24.06.26.01',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 10, 10, 10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
