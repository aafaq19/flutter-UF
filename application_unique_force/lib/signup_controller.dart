import 'package:application_unique_force/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signupcontroller extends GetxController {
  static Signupcontroller get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullname = TextEditingController();
  final number = TextEditingController();

  get confirmPassword => null;

  Future<void> registerUser(String email, String password) async {
    try {
      print("Attempting to register with email: $email and password: $password");
      await Authenticationrepository.instance.createUserwithEmailAndPassword(email, password);
      // If the function above does not throw an exception, assume success and navigate.
     // Get.offAll(() => Welcomescreen());  // Navigate to the HomeScreen
    } catch (e, stackTrace) {
  print('Error: $e');
  print('StackTrace: $stackTrace');
      // Handle error, possibly show an error message to the user
      Get.snackbar("Signup Error", "Failed to register: $e", snackPosition: SnackPosition.BOTTOM);
    }
  }
}
