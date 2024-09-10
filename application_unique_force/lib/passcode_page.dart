import 'package:application_unique_force/fingerprint_page.dart';
import 'package:application_unique_force/navigationbar.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(RotaryDialApp());

class RotaryDialApp extends StatelessWidget {
  const RotaryDialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rotary Dial Passcode',
      home: RotaryDialScreen(),
    );
  }
}

class RotaryDialScreen extends StatefulWidget {
  const RotaryDialScreen({super.key});

  @override
  _RotaryDialScreenState createState() => _RotaryDialScreenState();
}

class _RotaryDialScreenState extends State<RotaryDialScreen> {
  final String _correctPasscode = "1234";
  String _enteredPasscode = "";

  void _onNumberSelected(int number) {
    setState(() {
      if (number == -1) {
        // Handle "X" button tap
        if (_enteredPasscode.isNotEmpty) {
          _enteredPasscode =
              _enteredPasscode.substring(0, _enteredPasscode.length - 1);
        }
      } else if (_enteredPasscode.length < 4) {
        _enteredPasscode += number.toString();
        if (_enteredPasscode.length == 4) {
          _checkPasscode();
        }
      }
    });
  }

  void _checkPasscode() {
    if (_enteredPasscode == _correctPasscode) {
      _showDialog('Successfully Verified', 'Authentication Successfull!', true);
    } else {
      _showDialog('Incorrect Passcode', 'Try Again!', false);
    }
    _enteredPasscode = "";
  }

  void _showDialog(String title, String content, bool isSuccess) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog first

                if (isSuccess) {
                  // Navigate to the new page only if the passcode is correct
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyHomePage()),
                  );
                }
              },
              child: Text('OK'),
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
        title: Text('Authentication'),
        backgroundColor: Color.fromARGB(230, 243, 188, 133),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 135,
          ),
          const Text(
            'Enter Passcode',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  color: index < _enteredPasscode.length
                      ? Color.fromARGB(255, 243, 188, 125)
                      : Colors.grey,
                  shape: BoxShape.circle,
                ),
              );
            }),
          ),
          SizedBox(height: 40),
          Expanded(child: RotaryDial(onNumberSelected: _onNumberSelected)),
        ],
      ),
    );
  }
}

class RotaryDial extends StatelessWidget {
  final Function(int) onNumberSelected;

  RotaryDial({required this.onNumberSelected});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300, // Set a fixed width for the rotary dial container
        height: 300, // Set a fixed height for the rotary dial container
        child: Stack(
          alignment: Alignment.center,
          children: List.generate(11, (index) {
            double angle = index * 36.0; // Angle between numbers

            // Convert the angle to radians for trigonometric functions
            double angleRadians = angle * (pi / 180);

            // Calculate position using trigonometric functions
            double x = 100 * cos(angleRadians);
            double y = 100 * sin(angleRadians);

            return Positioned(
              left: 150 + x - 20, // Center and offset the circle
              top: 150 + y - 20, // Center and offset the circle
              child: GestureDetector(
                onTap: () =>
                    onNumberSelected(index == 10 ? -1 : index), // -1 for "X"
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Color.fromARGB(230, 247, 182, 117),
                  child: Text(
                    index == 10 ? 'X' : '$index',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
