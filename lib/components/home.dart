import 'package:bk_uji_level_remake/bimbingan/bimbingan_belajar.dart';
import 'package:bk_uji_level_remake/bimbingan/bimbingan_karir.dart';
import 'package:bk_uji_level_remake/bimbingan/bimbingan_pribadi.dart';
import 'package:bk_uji_level_remake/forms/form_portal.dart';
import 'package:flutter/material.dart';

import '../bimbingan/bimbingan_sosial.dart';

class Home extends StatefulWidget {
  final Map<String, dynamic> user;
  const Home({required this.user, Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    color: const Color(0xFF24a8df),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 50),
                      child: Row(
                        children: [
                          const Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.settings,
                                size: 32,
                                color: Colors.white,
                              )),
                          Expanded(
                            flex: 5,
                            child: Text(
                              "Selamat Datang, ${widget.user["name"]}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => FormPortal(user: widget.user)),
                                  );
                                },
                                child: const Icon(
                                  Icons.add,
                                  size: 32,
                                  color: Colors.white,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 105,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30.0),
                      width: MediaQuery.of(context).size.width - 60.0,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFFB6B5B5),
                            blurRadius: 1,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 28),
                    child: const Text(
                      "Lihat Bimbingan",
                      style: TextStyle(
                          color: Color(0xFF23282d),
                          fontWeight: FontWeight.bold,
                          fontSize: 19),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 16.5),
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => BimbinganPribadi(user: widget.user)),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 13),
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0xFFB6B5B5),
                                    spreadRadius: 0,
                                    blurRadius: 1,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(top: 18),
                                    child: Image.asset(
                                      "assets/chat.png",
                                      width: 80,
                                      height: 80,
                                    ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(top: 18),
                                      child: const Text(
                                        "Bimbingan Pribadi",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const BimbinganBelajar()),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 13),
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0xFFB6B5B5),
                                    spreadRadius: 0,
                                    blurRadius: 1,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(top: 18),
                                    child: Image.asset(
                                      "assets/study.png",
                                      width: 80,
                                      height: 80,
                                    ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(top: 18),
                                      child: const Text(
                                        "Bimbingan Belajar",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 16.5),
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const BimbinganSosial()),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 13),
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0xFFB6B5B5),
                                    spreadRadius: 0,
                                    blurRadius: 1,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(top: 18),
                                    child: Image.asset(
                                      "assets/meeting.png",
                                      width: 80,
                                      height: 80,
                                    ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(top: 18),
                                      child: const Text(
                                        "Bimbingan Sosial",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const BimbinganKarir()),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 13),
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0xFFB6B5B5),
                                    spreadRadius: 0,
                                    blurRadius: 1,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(top: 18),
                                    child: Image.asset(
                                      "assets/hard-work.png",
                                      width: 80,
                                      height: 80,
                                    ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(top: 18),
                                      child: const Text(
                                        "Bimbingan Karir",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
