import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // To format time

void main() {
  runApp(TimeManagementApp());
}

class TimeManagementApp extends StatelessWidget {
  const TimeManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clock In/Out App',
      home: ClockInOutPage(),
    );
  }
}

class ClockInOutPage extends StatefulWidget {
  @override
  _ClockInOutPageState createState() => _ClockInOutPageState();
}

class _ClockInOutPageState extends State<ClockInOutPage> {
  DateTime? clockInTime;
  DateTime? clockOutTime;

  // Method to handle clocking in
  void clockIn() {
    setState(() {
      clockInTime = DateTime.now();
      clockOutTime = null; // Reset clock-out time if already clocked in
    });
  }

  // Method to handle clocking out
  void clockOut() {
    if (clockInTime != null) {
      setState(() {
        clockOutTime = DateTime.now();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please clock in first!')),
      );
    }
  }

  // Method to format the time for display
  String formatTime(DateTime? time) {
    if (time == null) {
      return '--:--:--';
    }
    return DateFormat('HH:mm:ss').format(time);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(230, 243, 188, 133),
        title: Text('Clock In/Out'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Clock In Time: ${formatTime(clockInTime)}',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Clock Out Time: ${formatTime(clockOutTime)}',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: clockIn,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Text('Clock In'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: clockOut,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Text('Clock Out'),
            ),
            SizedBox(height: 20),
            if (clockInTime != null && clockOutTime != null)
              Text(
                'Total Time Worked: ${clockOutTime!.difference(clockInTime!).inHours} hours and ${clockOutTime!.difference(clockInTime!).inMinutes.remainder(60)} minutes',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
