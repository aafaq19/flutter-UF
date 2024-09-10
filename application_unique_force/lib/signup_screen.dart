import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:application_unique_force/constants/image_strings.dart';
import 'package:application_unique_force/constants/sizes.dart';
import 'package:application_unique_force/constants/text_strings.dart';
import 'package:application_unique_force/login_attendance.dart';
import 'package:application_unique_force/signup_controller.dart';

class Signupscreen extends StatelessWidget {
  const Signupscreen({super.key});
  static final formKey =
      GlobalKey<FormState>(); // Ensure this key is used with Form

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Signupcontroller());

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 100),
              const Center(
                child: Text(
                  attendanceregister,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Form(
                key: formKey,
                child: Container(
                  padding: const EdgeInsets.all(tDefaultSize),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: controller.fullname,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person_2_rounded),
                          labelText: tfullname,
                          hintText: tfullname,
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: controller.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.call),
                          labelText: tnumber,
                          hintText: tnumber,
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: controller.email,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                          labelText: tEmail,
                          hintText: tEmail,
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: controller.password,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock_rounded),
                          labelText: tPassword,
                          hintText: tPassword,
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: controller.password,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock_rounded),
                          labelText: confirmpassword,
                          hintText: confirmpassword,
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                if (formKey.currentState?.validate() ?? false) {
                                  String email = controller.email.text.trim();
                                  String password =
                                      controller.password.text.trim();
                                  if (email.isEmpty || !email.contains('@')) {
                                    Get.snackbar("Validation Error",
                                        "Invalid email format",
                                        snackPosition: SnackPosition.BOTTOM);
                                    return;
                                  }
                                  if (password.length < 6) {
                                    Get.snackbar(
                                        "Validation Error", "Password too weak",
                                        snackPosition: SnackPosition.BOTTOM);
                                    return;
                                  }
                                  controller.registerUser(email, password);
                                }
                              },
                              style: OutlinedButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                foregroundColor:
                                    const Color.fromARGB(255, 10, 10, 10),
                                backgroundColor:
                                    const Color.fromARGB(230, 242, 166, 90),
                                padding: const EdgeInsets.symmetric(
                                    vertical: tButtonHeight),
                                side: BorderSide.none,
                              ),
                              child: const Text(
                                attendanceregister,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
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
            ]),
          ),
        ),
      ),
    );
  }
}
