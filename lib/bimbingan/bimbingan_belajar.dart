import 'package:flutter/material.dart';

class Bimbingan_Belajar extends StatefulWidget {
  const Bimbingan_Belajar({super.key});

  @override
  State<Bimbingan_Belajar> createState() => _Bimbingan_BelajarState();
}

class _Bimbingan_BelajarState extends State<Bimbingan_Belajar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Center(
            child: Column(children: [
              Container(
                margin: const EdgeInsets.only(top: 17),
                child: Row(
                  children: [
                    IconButton(
                        color: const Color(0xFF000000),
                        iconSize: 24,
                        onPressed: () {
                          Navigator.pushNamed(context, "/home");
                        },
                        icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                    const SizedBox(
                      width: 9,
                    ),
                    const Text("List Bimbingan Belajar",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                width: double.infinity,
                color: Colors.transparent,
                height: 300,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.white,
                        ),
                        width: double.infinity,
                        margin: const EdgeInsets.fromLTRB(0, 6, 0, 6),
                        height: 120,
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 200,
                                    margin: const EdgeInsets.only(top: 5),
                                    child: const Text(
                                      "Konsultasi 1",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 18),
                                    child: const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Text("Guru BK"),
                                        Text(
                                          "Abhiram Aditya S.Pd",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Text("2001-9-11")
                                ],
                              ),
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.only(right: 15),
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, "/bimbingan_belajar/details");
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              const Color(0xFFcb0c9f))),
                                  child: const Text(
                                    "Detail",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 15,
                                    ),
                                  )),
                            )
                          ],
                        )),
                  ],
                ),
              )
            ]),
          )
        ],
      )),
    );
  }
}
