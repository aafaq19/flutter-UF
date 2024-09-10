import 'package:application_unique_force/new_crendation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:application_unique_force/constants/sizes.dart';
import 'package:application_unique_force/constants/text_strings.dart';

class Forgetpasswormailscreen extends StatelessWidget {
  const Forgetpasswormailscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 200),
              const Text(
                tForgot,
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              const Text(
                provide,
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Form(
                child: Column(children: [
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                      labelText: tEmail,
                      hintText: tEmail,
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Get.to(() => const Newscreen());
                          },
                          style: OutlinedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(40),
                              ),
                            ),
                            foregroundColor: const Color.fromARGB(255, 8, 8, 8),
                            backgroundColor:
                                const Color.fromARGB(230, 242, 166, 90),
                            padding: const EdgeInsets.symmetric(
                                vertical: tButtonHeight),
                            side: BorderSide.none,
                          ),
                          child: Text(next.toUpperCase(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              )),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
