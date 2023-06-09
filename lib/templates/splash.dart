import 'dart:async';

import 'package:bk_uji_level/templates/login.dart';
import 'package:flutter/material.dart';

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
        MaterialPageRoute(builder: (context) => const Login()),
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
                    margin: const EdgeInsets.fromLTRB(0,0,10,25),
                    duration: const Duration(milliseconds: 300),
                    child: SizedBox(
                      height: 220,
                      width: 220,
                      child: Image.asset("assets/logo.png")
                    )
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

