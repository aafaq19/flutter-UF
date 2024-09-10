import 'package:application_unique_force/applyleave_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() {
  runApp(const MaterialApp(
    home: LeaveDashboardPage(),
  ));
}

class LeaveDashboardPage extends StatelessWidget {
  const LeaveDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Leave Dashboard'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Upcoming Holidays Section
                Card(
                  color: const Color.fromARGB(235, 255, 232, 198),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                  child: ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.calendar_today, size: 40),
                        Text('02'),
                      ],
                    ),
                    title: const Text('Upcoming Holidays',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: const Text('Sep | Mon | 2024\nUS Labor Day'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      // Handle tap on the holiday card
                    },
                  ),
                ),
                const SizedBox(height: 20),

                // Leave Balance Section
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Leave Balance',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            Icon(Icons.info_outline),
                          ],
                        ),
                        const SizedBox(height: 60),

                        // Circular Leave Indicator
                        Center(
                          child: CircularPercentIndicator(
                            radius: 90.0,
                            lineWidth: 10.0,
                            percent: 11 / 26, // Percentage of available leave
                            center: const Text(
                              "11\nAvailable Day(s)",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16),
                            ),
                            progressColor: Colors.orange,
                            backgroundColor: Colors.green,
                          ),
                        ),
                        const SizedBox(height: 60),

                        // Leave Type List
                        const Column(
                          children: [
                            LeaveTypeTile(
                              'Casual Leave',
                              2,
                              Colors.green,
                              textStyle: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            LeaveTypeTile(
                              'Sick Leave',
                              9,
                              Colors.orange,
                              textStyle: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            LeaveTypeTile(
                              'Earned Leave',
                              0,
                              Colors.blue,
                              textStyle: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            LeaveTypeTile(
                              'Comp off',
                              0,
                              Colors.brown,
                              textStyle: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            LeaveTypeTile(
                              'Paternity Leave',
                              5,
                              Colors.green,
                              textStyle: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            LeaveTypeTile(
                              'Permission',
                              2,
                              Colors.red,
                              textStyle: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            LeaveTypeTile(
                              'LOP',
                              0,
                              Colors.yellow,
                              textStyle: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Leave History and Raise Request Buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.history),
                        label: const Text('Leave History'),
                        onPressed: () {
                          // Handle leave history button
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(230, 242, 166, 90),
                          foregroundColor: Colors.black,
                          textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold), // Add this line
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.add),
                        label: const Text('Raise Request'),
                        onPressed: () {
                          Get.to(() => ApplyLeavePage());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(230, 242, 166, 90),
                          foregroundColor: Colors.black,
                          textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold), // Add this line
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

class LeaveTypeTile extends StatelessWidget {
  final String title;
  final int days;
  final Color color;

  const LeaveTypeTile(this.title, this.days, this.color,
      {super.key, required TextStyle textStyle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.circle, color: color),
      title: Text(title),
      trailing: Text(days.toString()),
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
    );
  }
}
