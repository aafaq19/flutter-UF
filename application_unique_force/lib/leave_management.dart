import 'package:flutter/material.dart';

void main() {
  runApp(const LeaveManagementApp());
}

class LeaveManagementApp extends StatelessWidget {
  const LeaveManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leave Management System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LeaveManagementPage(),
    );
  }
}

class LeaveManagementPage extends StatefulWidget {
  @override
  _LeaveManagementPageState createState() => _LeaveManagementPageState();
}

class _LeaveManagementPageState extends State<LeaveManagementPage> {
  final _leaveTypeController = TextEditingController();
  final _leaveDaysController = TextEditingController();

  Employee employee = Employee(
    name: 'Saqlain',
    sickDays: 10,
    vacationDays: 20,
    warnings: 0,
  );

  LeaveManagementSystem leaveSystem = LeaveManagementSystem();

  void _applyForLeave() {
    String leaveType = _leaveTypeController.text.trim();
    int leaveDays = int.tryParse(_leaveDaysController.text) ?? 0;

    if (leaveType.isNotEmpty && leaveDays > 0) {
      String result = leaveSystem.applyForLeave(employee, leaveType, leaveDays);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Leave Application Result'),
          content: Text(result),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void _checkLeaveBalance() {
    String balance = leaveSystem.checkLeaveBalance(employee);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Leave Balance'),
        content: Text(balance),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _leaveTypeController.dispose();
    _leaveDaysController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(230, 243, 188, 133),
        title: Text('Leave Management'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, ${employee.name}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _leaveTypeController,
              decoration: InputDecoration(
                labelText: 'Enter Leave Type (e.g., Vacation, Sick)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _leaveDaysController,
              decoration: InputDecoration(
                labelText: 'Enter Number of Days',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _applyForLeave,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(230, 243, 188, 133),
                    foregroundColor:
                        Colors.black, // Background color of the button
                  ),
                  child: Text('Apply for Leave'),
                ),
                ElevatedButton(
                  onPressed: _checkLeaveBalance,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(230, 243, 188, 133),
                    foregroundColor:
                        Colors.black, // Background color of the button
                  ),
                  child: Text('Check Leave Balance'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Employee {
  String name;
  int sickDays;
  int vacationDays;
  int warnings;

  Employee({
    required this.name,
    this.sickDays = 10,
    this.vacationDays = 20,
    this.warnings = 0,
  });

  // Display current status
  void displayStatus() {
    print('$name\'s Status:');
    print('Sick Days Remaining: $sickDays');
    print('Vacation Days Remaining: $vacationDays');
    print('Warnings: $warnings');
  }
}

class LeaveManagementSystem {
  String applyForLeave(Employee employee, String leaveType, int days) {
    if (leaveType.toLowerCase() == 'sick' && days <= employee.sickDays) {
      employee.sickDays -= days;
      return 'Sick leave for $days days approved. Remaining Sick Days: ${employee.sickDays}';
    } else if (leaveType.toLowerCase() == 'vacation' &&
        days <= employee.vacationDays) {
      employee.vacationDays -= days;
      return 'Vacation leave for $days days approved. Remaining Vacation Days: ${employee.vacationDays}';
    } else {
      return 'Leave request denied. Insufficient leave balance.';
    }
  }

  String checkLeaveBalance(Employee employee) {
    return 'Sick Days: ${employee.sickDays}\nVacation Days: ${employee.vacationDays}';
  }
}
