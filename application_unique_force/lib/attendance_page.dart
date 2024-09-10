import 'package:application_unique_force/admin_login_page.dart';
import 'package:application_unique_force/constants/image_strings.dart';
import 'package:application_unique_force/constants/sizes.dart';
import 'package:application_unique_force/constants/text_strings.dart';
import 'package:application_unique_force/login_attendance.dart';
import 'package:application_unique_force/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: const Color.fromARGB(255, 255, 246, 233),
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Center(
                  child: Image(
                    image: AssetImage('assets/attendance.png'),
                  ),
                ),
                const SizedBox(height: 25),
                const Center(
                  child: Column(
                    children: [
                      Text(
                        attendancetitle,
                        style: TextStyle(
                          fontSize: 24,
                          color: Color.fromARGB(230, 5, 5, 5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        attendancesubtitle,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Get.to(() => const AdminLoginScreen());
                        },
                        style: OutlinedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                          ),
                          foregroundColor: const Color.fromARGB(255, 8, 8, 8),
                          backgroundColor:
                              const Color.fromARGB(230, 248, 183, 119),
                          padding: const EdgeInsets.symmetric(
                            vertical: tButtonHeight,
                          ),
                          side: BorderSide.none,
                        ),
                        child: Text(
                          attendancecontinue.toUpperCase(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Get.to(() => const Signupscreen());
                        },
                        style: OutlinedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                          ),
                          foregroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          backgroundColor: const Color.fromARGB(230, 0, 0, 0),
                          padding: const EdgeInsets.symmetric(
                            vertical: tButtonHeight,
                          ),
                          side: BorderSide.none,
                        ),
                        child: Text(
                          attendancesignin.toUpperCase(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
