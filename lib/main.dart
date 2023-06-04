import 'package:bk_uji_level/templates/home.dart';
import 'package:bk_uji_level/templates/details.dart';
import 'package:bk_uji_level/templates/splash.dart';
import 'package:flutter/material.dart';

void main() => runApp (MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/': (context) => const Splash(),
    '/home': (context) => const Home(),
    '/details': (context) => const Details(),
  },
));