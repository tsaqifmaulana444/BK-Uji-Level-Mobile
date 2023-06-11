import 'package:bk_uji_level/bimbingan/bimbingan_karir.dart';
import 'package:bk_uji_level/bimbingan/bimbingan_pribadi.dart';
import 'package:bk_uji_level/templates/home.dart';
import 'package:bk_uji_level/bimbingan/details/bimbingan_pribadi_details.dart';
import 'package:bk_uji_level/templates/login.dart';
import 'package:bk_uji_level/templates/splash.dart';
import 'package:flutter/material.dart';
import 'bimbingan/bimbingan_belajar.dart';
import 'bimbingan/bimbingan_sosial.dart';
import 'bimbingan/details/bimbingan_belajar_details.dart';
import 'bimbingan/details/bimbingan_karir_details.dart';
import 'bimbingan/details/bimbingan_sosial_details.dart';

void main() => runApp (MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/': (context) => const Splash(),
    '/login': (context) => const Login(),
    '/home': (context) => const Home(),

    // bimbingan pribadi
    '/bimbingan_pribadi': (context) => const Bimbingan_Pribadi(),
    '/bimbingan_pribadi/details': (context) => const Bimbingan_Pribadi_Details(),

    // bimbingan belajar
    '/bimbingan_belajar': (context) => const Bimbingan_Belajar(),
    '/bimbingan_belajar/details': (context) => const Bimbingan_Belajar_Details(),

    //bimbingan sosial
    '/bimbingan_sosial': (context) => const Bimbingan_Sosial(),
    '/bimbingan_sosial/details': (context) => const Bimbingan_Sosial_Details(),

    //bimbingan karir
    '/bimbingan_karir': (context) => const Bimbingan_Karir(),
    '/bimbingan_karir/details': (context) => const Bimbingan_Karir_Details(),
  },
));