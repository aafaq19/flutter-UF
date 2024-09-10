import 'package:flutter/material.dart';

void main() {
  runApp(MyAppie());
}

class MyAppie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BudgetScreen(),
    );
  }
}

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({super.key});

  @override
  _BudgetScreenState createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  double _budget = 120000; // Initial budget value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Text('Where do you want go?', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Thailand', style: TextStyle(fontSize: 16)),
                  Icon(Icons.arrow_drop_down, color: Colors.red),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text('When do you want go?', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('20 Jul 2025', style: TextStyle(fontSize: 16)),
                  Icon(Icons.calendar_today, color: Colors.red),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text('What is your budget', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text(
              '₹${_budget.toStringAsFixed(0)}', // Display current budget
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Slider(
              value: _budget,
              min: 0,
              max: 200000,
              divisions: 100,
              activeColor: Colors.red,
              inactiveColor: Colors.grey,
              onChanged: (double value) {
                setState(() {
                  _budget = value; // Update budget value when slider is moved
                });
              },
            ),
            SizedBox(height: 20),
            Text('Priority select', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Must have', style: TextStyle(fontSize: 16)),
                  Icon(Icons.arrow_drop_down, color: Colors.red),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Map your existing assets',
                  style: TextStyle(fontSize: 18),
                ),
                Switch(
                  value: true,
                  activeColor: Colors.red,
                  onChanged: (bool value) {
                    // Handle switch change
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Assets', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('DSP NIFTY 50', style: TextStyle(fontSize: 16)),
                  Icon(Icons.radio_button_checked, color: Colors.red),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
