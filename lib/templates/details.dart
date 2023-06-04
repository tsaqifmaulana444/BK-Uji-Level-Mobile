import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFF0F0F0),
        body: SafeArea(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
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
                        const Text("Detail Pertemuan",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 15),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nama Siswa",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("Pradu Singh"),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 15),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Kelas",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("XI IPA 1"),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 15),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tempat & Tanggal",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("SMK Penerus Petrus, 2001-9-11"),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 15),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Jam",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("08.10 WIB"),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Alasan Pertemuan",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 7),
                        Container(
                            width: double.infinity,
                            height: 110,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: ListView(
                                scrollDirection: Axis.vertical,
                                children: const [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: Text(
                                        "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis "),
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Tindak Lanjut",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 7),
                        Container(
                            width: double.infinity,
                            height: 110,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: ListView(
                                scrollDirection: Axis.vertical,
                                children: const [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: Text(
                                        "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis "),
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                  )
                ]),
              )
            ],
          ),
        ),
        
      ),
    );
  }
}

// tema, nama siswa, kelas, tanggal guru, jam, tempat,alasan, tindak lanjut