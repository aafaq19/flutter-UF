import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:application_unique_force/about_us_page.dart';
import 'package:application_unique_force/attendance_page.dart';
import 'package:application_unique_force/constants/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/IT.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Main content
          Container(
            margin: const EdgeInsets.only(top: 110),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Welcome to \n     Unique Force",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      height: 1.1),
                ),
                const Spacer(),
                BuildBluredWidget(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding BuildBluredWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 110, right: 28, left: 28),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 4, 56, 124).withOpacity(0.09),
            ),
            height: 260,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, right: 20, left: 20),
                    child: const Text(
                      "Create innovative ideas that improve the world. Discover and innovate in the world with utmost simplicity",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: MyColors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 26, right: 65, left: 65),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const AttendancePage(),
                            transitionDuration:
                                const Duration(milliseconds: 650),
                            transitionsBuilder: (_, a, __, c) =>
                                FadeTransition(opacity: a, child: c),
                          ),
                        );
                      },
                      child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color.fromARGB(230, 242, 166, 90)
                              .withOpacity(0.5),
                        ),
                        child: const Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Get started now",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 8), // Space between text and icon
                              Icon(
                                Icons.arrow_right_alt, // Icon of a right arrow
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16, right: 65, left: 65),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => AboutUsPage(),
                            transitionDuration:
                                const Duration(milliseconds: 650),
                            transitionsBuilder: (_, a, __, c) =>
                                FadeTransition(opacity: a, child: c),
                          ),
                        );
                      },
                      child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color.fromARGB(230, 242, 166, 90)
                              .withOpacity(0.5),
                        ),
                        child: const Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "About Us",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 8), // Space between text and icon
                              Icon(
                                Icons.arrow_right_alt, // Icon of a right arrow
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
