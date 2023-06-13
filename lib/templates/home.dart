import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../bimbingan/bimbingan_pribadi.dart';
import 'login.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  final int _currentPageIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  // Add this line to declare the token variable
  String token = '';

  @override
  void initState() {
    super.initState();
    fetchData(token);
  }

  Future<void> fetchData(String token) async {
    print(token); // Print the token
    final url = Uri.parse('http://127.0.0.1:8000/api/data'); // Replace with your API endpoint

    final headers = {
      'Authorization': 'Bearer $token', // Include the token in the Authorization header
    };

    final response = await http.get(url, headers: headers);

    // Rest of the code to handle the response...
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        backgroundColor: const Color(0xFFF0F0F0),
        body: SafeArea(
            child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Center(
                child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: Row(children: [
                    IconButton(
                      iconSize: 42,
                      icon: const Icon(Icons.menu_rounded),
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                    ),
                  ]),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Selamat Datang,", style: TextStyle(fontSize: 15)),
                        SizedBox(
                          height: 2,
                        ),
                        Text("Udin",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(20, 25, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: const CircleAvatar(
                                  radius: 27,
                                  backgroundColor: Color(0xFFcb0c9f),
                                  child: Text("3",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                          color: Colors.white)),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const SizedBox(
                                width: 60,
                                child: Text(
                                  "Total Pertemuan",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 71, 71, 71)),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: const CircleAvatar(
                                  radius: 27,
                                  backgroundColor: Color(0xFFcb0c9f),
                                  child: Text("!",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30,
                                          color: Colors.white)),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const SizedBox(
                                width: 60,
                                child: Text(
                                  "Informasi Aplikasi",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 71, 71, 71)),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: CircleAvatar(
                                    radius: 27,
                                    backgroundColor: const Color(0xFFcb0c9f),
                                    child: SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: Image.asset("assets/internet.png"),
                                    )),
                              ),
                              const SizedBox(height: 5),
                              const SizedBox(
                                width: 60,
                                child: Text(
                                  "Kunjungi Web",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 71, 71, 71)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),

                // bimbingan section
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 25, 20, 0),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Lihat Data Bimbingan",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, "/bimbingan_pribadi");
                              },
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                                width: 145,
                                height: 150,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(children: [
                                  Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 20, 0, 25),
                                      width: 65,
                                      height: 65,
                                      child: Image.asset(
                                          "assets/communication.png")),
                                  const Text("Bimbingan Pribadi",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold))
                                ]),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, "/bimbingan_belajar");
                              },
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                                width: 145,
                                height: 150,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(children: [
                                  Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 20, 0, 25),
                                      width: 65,
                                      height: 65,
                                      child: Image.asset("assets/idea.png")),
                                  const Text("Bimbingan Belajar",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold))
                                ]),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, "/bimbingan_sosial");
                              },
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                                width: 145,
                                height: 150,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(children: [
                                  Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 20, 0, 25),
                                      width: 65,
                                      height: 65,
                                      child: Image.asset(
                                          "assets/conversation.png")),
                                  const Text("Bimbingan Sosial",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold))
                                ]),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, "/bimbingan_karir");
                              },
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                                width: 145,
                                height: 150,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(children: [
                                  Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 20, 0, 25),
                                      width: 65,
                                      height: 65,
                                      child:
                                          Image.asset("assets/portfolio.png")),
                                  const Text("Bimbingan Karir",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold))
                                ]),
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ))
              ],
            )),
          ],
        )),
        drawer: Drawer(
          backgroundColor: const Color(0xFFF6F6F6),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: Color(0xFFF0F0F0)),
                accountName: const Text(
                  'Udin',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                      letterSpacing: 1,
                      color: Color(0xFF141414)),
                ),
                accountEmail: const Text(
                  'ujang@gmail.com',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 12,
                      color: Color(0xFF141414)),
                ),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                      child: Image.asset(
                    "assets/download.jpeg",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  )),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Page 1'),
                onTap: () {},
                selected: _currentPageIndex == 0,
                selectedColor: Colors.black,
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Page 2'),
                onTap: () {},
                selected: _currentPageIndex == 1,
                selectedColor: Colors.black,
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('Page 3'),
                onTap: () {},
                selected: _currentPageIndex == 2,
                selectedColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
