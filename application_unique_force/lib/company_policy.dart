import 'package:application_unique_force/contact_support.dart';
import 'package:application_unique_force/faq.dart';
import 'package:application_unique_force/getting_started.dart';
import 'package:application_unique_force/leave_management.dart';
import 'package:application_unique_force/time_management.dart';
import 'package:application_unique_force/work_balance.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:application_unique_force/attendance_policy.dart';

// ignore: camel_case_types
class company extends StatelessWidget {
  const company({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(230, 243, 188, 133),
          title: const Text('Company Policy'),
          bottom: const TabBar(
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            tabs: [
              Tab(text: 'Tutorials'),
              Tab(text: 'Policies'),
              Tab(text: 'Tips'),
              Tab(text: 'Support'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildTutorialsTab(context),
            _buildPoliciesTab(context),
            _buildTipsTab(context),
            _buildSupportTab(context),
          ],
        ),
      ),
    );
  }

  // Function to build the Tutorials Tab
  Widget _buildTutorialsTab(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildCard(
          title: 'Getting Started',
          description: 'Learn how to get started with the app.',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GettingStartedScreen()),
            );
          },
        ),
        _buildCard(
          title: 'Clocking In/Out',
          description: 'Step-by-step guide on using the clock feature.',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TimeManagementApp()),
            );
          },
        ),
      ],
    );
  }

  // Function to build the Policies Tab
  Widget _buildPoliciesTab(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        _buildCard(
          title: 'Attendance Policy',
          description: 'Understand the company attendance policies.',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AttendancePolicyPage()),
            );
          },
        ),
        _buildCard(
          title: 'Leave Management',
          description: 'How to apply for leave and check balances.',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LeaveManagementPage()),
            );
          },
        ),
      ],
    );
  }

  // Function to build the Tips Tab
  Widget _buildTipsTab(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        _buildCard(
          title: 'Time Management',
          description: 'Improve your productivity with these tips.',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TimeManagementScreen()),
            );
          },
        ),
        _buildCard(
          title: 'Work-Life Balance',
          description: 'Tips for balancing work and personal life.',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WorkLifeBalanceScreen()),
            );
          },
        ),
      ],
    );
  }

  // Function to build the Support Tab
  Widget _buildSupportTab(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        _buildCard(
          title: 'FAQs',
          description: 'Find answers to common questions.',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FAQsScreen()),
            );
          },
        ),
        _buildCard(
          title: 'Contact Support',
          description: 'Reach out to our support team for help.',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ContactSupportScreen()),
            );
          },
        ),
      ],
    );
  }

  // Updated _buildCard method with custom styling
  Widget _buildCard({
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8.0), // Margin around the card
        padding: EdgeInsets.all(16.0), // Padding inside the card
        decoration: BoxDecoration(
          color: Color.fromARGB(
              237, 255, 255, 255), // Background color of the card
          borderRadius: BorderRadius.circular(8.0), // Rounded corners
          border: Border.all(
            color:
                const Color.fromARGB(230, 243, 188, 133), // Solid border color
            width: 2.0, // Border width for boldness
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 211, 105, 0)
                  .withOpacity(0.3), // Shadow color
              spreadRadius: 3, // Spread radius of shadow
              blurRadius: 9, // Blur radius of shadow
              offset: Offset(2, 4), // Position offset of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              description,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
