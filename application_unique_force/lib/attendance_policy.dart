import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: AttendancePolicyPage(),
  ));
}

class AttendancePolicyPage extends StatefulWidget {
  @override
  _AttendancePolicyPageState createState() => _AttendancePolicyPageState();
}

class _AttendancePolicyPageState extends State<AttendancePolicyPage> {
  bool isClockedIn = false;
  DateTime? clockInTime;
  DateTime? clockOutTime;
  int lateArrivals = 0;
  final int maxLateArrivals = 3;

  List<Map<String, String>> leaveRequests = [
    {'date': '2024-08-10', 'status': 'Pending'},
    {'date': '2024-08-15', 'status': 'Approved'},
  ];

  void toggleClockInOut() {
    setState(() {
      if (!isClockedIn) {
        clockInTime = DateTime.now();
        isClockedIn = true;
        String message =
            'Clocked in at ${clockInTime!.hour}:${clockInTime!.minute}';

        // Check for late arrival
        if (clockInTime!.hour > 9 ||
            (clockInTime!.hour == 9 && clockInTime!.minute > 0)) {
          lateArrivals++;
          message += ' (Late Arrival)';
        }

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Clock In'),
              content: Text(message),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        clockOutTime = DateTime.now();
        isClockedIn = false;
        String message =
            'Clocked out at ${clockOutTime!.hour}:${clockOutTime!.minute}';

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Clock Out'),
              content: Text(message),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  String getPolicyMessage() {
    if (lateArrivals > maxLateArrivals) {
      return 'Warning: Exceeded maximum late arrivals!';
    }
    return 'You have $lateArrivals late arrival(s).';
  }

  void _requestLeave() {
    setState(() {
      leaveRequests.add({'date': '2024-08-20', 'status': 'Pending'});
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Leave Request'),
          content: const Text('Leave request submitted successfully.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(230, 243, 188, 133),
        title: const Text('Attendance Policy'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: toggleClockInOut,
              style: ElevatedButton.styleFrom(
                backgroundColor: isClockedIn ? Colors.red : Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: Text(
                isClockedIn ? 'Clock Out' : 'Clock In',
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Attendance Policy',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              '1. Clock in by 9:30 AM to avoid late arrival penalties.',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              '2. Late arrivals exceeding $maxLateArrivals times will trigger a warning.',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              '3. Clock out at the end of your shift.',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Text(
              getPolicyMessage(),
              style: const TextStyle(fontSize: 18, color: Colors.red),
            ),
            const SizedBox(height: 30),
            const Text(
              'Leave Requests',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: leaveRequests.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Date: ${leaveRequests[index]['date']}'),
                    subtitle: Text('Status: ${leaveRequests[index]['status']}'),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _requestLeave,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(230, 243, 188, 133),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text(
                'Request Leave',
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
