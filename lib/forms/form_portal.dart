import 'package:bk_uji_level_remake/components/home.dart';
import 'package:flutter/material.dart';

import 'form_bimbingan_pribadi.dart';
class FormPortal extends StatefulWidget {
  final Map<String, dynamic> user;
  // widget.user
  const FormPortal({required this.user, Key? key}) : super(key: key);

  @override
  State<FormPortal> createState() => _FormPortalState();
}

class _FormPortalState extends State<FormPortal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          TextButton(onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Home(user: widget.user)),
            );
          }, child: const Text("Back")),
          TextButton(onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => FormBimbinganPribadi(user: widget.user)),
            );
          }, child: const Text("BimbinganPribadi")),
          TextButton(onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => FormBimbinganPribadi(user: widget.user)),
            );
          }, child: const Text("BimbinganBelajar")),
          TextButton(onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => FormBimbinganPribadi(user: widget.user)),
            );
          }, child: const Text("BimbinganSosial")),
          TextButton(onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => FormBimbinganPribadi(user: widget.user)),
            );
          }, child: const Text("BimbinganKarir")),
        ],
      ),
    );
  }
}
