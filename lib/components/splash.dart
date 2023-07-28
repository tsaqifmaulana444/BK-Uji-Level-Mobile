import 'dart:async';
import 'package:flutter/material.dart';

import 'login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    });

    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "splash",
      home: Scaffold(
        body: Container(
          margin: const EdgeInsets.only(top: 10),
          child: Center(
            child: AnimatedBuilder(
              animation: _opacityAnimation,
              builder: (BuildContext context, Widget? child) {
                return Opacity(
                  opacity: _opacityAnimation.value,
                  child: AnimatedContainer(
                      margin: const EdgeInsets.only(bottom: 40),
                      duration: const Duration(milliseconds: 500),
                      child: SizedBox(
                          height: 280,
                          width: 280,
                          child: Image.asset("assets/logo.png"))),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
