import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:application_unique_force/navigationbar.dart';
import 'package:application_unique_force/constants/sizes.dart';
import 'package:application_unique_force/constants/text_strings.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<AdminLoginScreen> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 246, 233),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(tDefaultSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                top: 50), // add a top margin of 20
                            child: const Row(
                              children: [
                                Image(
                                  image: AssetImage('assets/3U.png'),
                                  fit: BoxFit.cover,
                                  color:
                                      const Color.fromARGB(230, 255, 239, 223),
                                  alignment: Alignment.center,
                                  repeat: ImageRepeat.noRepeat,
                                  colorBlendMode: BlendMode.colorBurn,
                                  filterQuality: FilterQuality.high,
                                ),
                                SizedBox(
                                    width:
                                        1), // add some space between the image and the text
                                Text(
                                  uniqueforce,
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Color.fromARGB(255, 245, 125, 6),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30), // Added spacing
                          Text(
                            tadminLogin,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20), // Added spacing
                  Form(
                    child: Container(
                      padding: const EdgeInsets.all(tDefaultSize),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.email),
                              labelText: tcompanyEmail,
                              hintText: tcompanyEmail,
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              prefixIcon: const Icon(Icons.lock),
                              labelText: tPassword,
                              hintText: tPassword,
                              labelStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 40),
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () {
                                    Get.to(() => const MyHomePage());
                                  },
                                  style: OutlinedButton.styleFrom(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(40),
                                      ),
                                    ),
                                    foregroundColor:
                                        const Color.fromARGB(255, 8, 8, 8),
                                    backgroundColor:
                                        const Color.fromARGB(230, 242, 166, 90),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: tButtonHeight),
                                    side: BorderSide.none,
                                  ),
                                  child: Text(
                                    tLogin.toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 15,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showModelButtonsheet({
    required BuildContext context,
    required Widget Function(BuildContext context) builder,
    required RoundedRectangleBorder shape,
  }) {
    showModalBottomSheet(
      context: context,
      builder: builder,
      shape: shape,
    );
  }
}
