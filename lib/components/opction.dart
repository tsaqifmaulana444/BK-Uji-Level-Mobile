import 'package:bk_uji_level_remake/components/login.dart';
import 'package:bk_uji_level_remake/components/login_guru.dart';
import 'package:flutter/material.dart';
import 'package:bk_uji_level_remake/components/splash.dart';

class opction extends StatefulWidget {
  const opction({super.key});

  @override
  State<opction> createState() => _opctionState();
}

class _opctionState extends State<opction> {
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
           // Menentukan sumbu utama menjadi vertikal (flex)
          children: [
            AnimatedContainer(
              margin: const EdgeInsets.only(bottom: 20),
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 280,
                width: 280,
                child: Image.asset("assets/logo.png"))),
             InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.blue,
                ),
                child: Text(
                 'Login Sebagai Siswa',
                style: TextStyle(color: Colors.white, fontSize: 16),
                ),
               ),
              ),
           ),
           InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginGuru()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.blue,
                ),
                child: Text(
                 'Login Sebagai Guru',
                style: TextStyle(color: Colors.white, fontSize: 16),
                ),
               ),
              ),
           )
          ],
        ),
      ),
    );
  }
}