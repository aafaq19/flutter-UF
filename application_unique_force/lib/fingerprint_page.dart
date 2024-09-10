import 'package:application_unique_force/passcode_page.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

void main() {
  runApp(FingerprintPasscodeApp());
}

class FingerprintPasscodeApp extends StatelessWidget {
  const FingerprintPasscodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fingerprint & Passcode',
      home: AuthenticationScreen(),
    );
  }
}

class AuthenticationScreen extends StatelessWidget {
  final LocalAuthentication auth = LocalAuthentication();

  Future<void> _authenticateWithBiometrics(BuildContext context) async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: 'Authenticate to access your account',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
    } catch (e) {
      print(e);
    }

    if (authenticated) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SuccessScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => _authenticateWithBiometrics(context),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(230, 255, 239, 223),
                ),
                child: const Icon(
                  Icons.fingerprint,
                  size: 100,
                  color: Color.fromARGB(230, 204, 109, 14),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Try Fingerprint',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RotaryDialScreen()),
                );
              },
              child: Text('Else Try Passcode?'),
            ),
          ],
        ),
      ),
    );
  }
}

class PasscodeScreen extends StatelessWidget {
  final TextEditingController _passcodeController = TextEditingController();

  void _checkPasscode(BuildContext context) {
    const correctPasscode =
        '1234'; // For demonstration only; use secure storage in production
    if (_passcodeController.text == correctPasscode) {
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Incorrect Passcode')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter Passcode')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _passcodeController,
                obscureText: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Passcode',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => _checkPasscode(context),
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Success')),
      body: Center(
        child: Text(
          'Authentication Successful!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
