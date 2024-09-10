import 'package:application_unique_force/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:application_unique_force/constants/text_strings.dart';
import 'package:application_unique_force/login_attendance.dart';
import 'package:get/get.dart';

class Verified extends StatelessWidget {
  const Verified({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              passwordupdated,
              style: TextStyle(
                color: Color.fromARGB(235, 12, 12, 12),
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 35.0,
            ),
            const Text(
              yourpassword,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 35.0,
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Get.to(() => const LoginScreen());
                    },
                    style: OutlinedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      foregroundColor: const Color.fromARGB(255, 8, 8, 8),
                      backgroundColor: const Color.fromARGB(230, 242, 166, 90),
                      padding:
                          const EdgeInsets.symmetric(vertical: tButtonHeight),
                      side: BorderSide.none,
                    ),
                    child: Text(tcontinueLogin.toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
