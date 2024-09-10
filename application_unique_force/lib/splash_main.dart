import 'package:flutter/material.dart';

class SplashMain extends StatefulWidget {
  const SplashMain({super.key});

  @override
  State<SplashMain> createState() => _homeState();
}

class _homeState extends State<SplashMain> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration:
          const Duration(seconds: 2), // increase the duration for slow motion
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 3).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn, // use a slower curve for slow motion
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(230, 255, 239, 223),
        body: Container(
          child: Center(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return SizedBox(
                  width: 550 * _animation.value,
                  height: 550 * _animation.value,
                  child: const Image(
                    image: AssetImage('assets/unique-logo.png'),
                    repeat: ImageRepeat.noRepeat,
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
