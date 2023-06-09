
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  final int _currentPageIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

 

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
                      // const Spacer(),
                      // Container(
                      //   margin: const EdgeInsets.only(right: 12),
                      //   child: const CircleAvatar(
                      //     radius: 25,
                      //     backgroundImage: AssetImage('assets/download.jpeg'),
                      //   ),
                      // )
                    ]),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                    child: const Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Selamat Datang,",
                              style: TextStyle(fontSize: 15)),
                          SizedBox(
                            height: 2,
                          ),
                          Text("Pradu Singh",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
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
                                    backgroundImage: AssetImage('assets/!.png'),
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
                                    backgroundImage: AssetImage('assets/!.png'),
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
                                  child: const CircleAvatar(
                                    radius: 27,
                                    backgroundImage:
                                        AssetImage('assets/web.png'),
                                  ),
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
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Laporan Pertemuan",
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
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 0, 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 200,
                                        margin: const EdgeInsets.only(top: 5),
                                        child: const Text(
                                          "Apakah Aku Jelmaan Tottenham?",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(top: 18),
                                        child: const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Text("Guru BK"),
                                            Text(
                                              "Abhiram Aditya S.Pd",
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold),
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
                                            context, "/details");
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<
                                                      Color>(
                                                  const Color(0xFF629460))),
                                      child: const Text(
                                        "Detail",
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontSize: 15,
                                        ),
                                      )),
                                )
                              ],
                            )),
                      ],
                    ),
                  )
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
                      'Pradu Singh',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                        letterSpacing: 1,
                        color: Color(0xFF141414)
                      ),
                    ),
                    accountEmail: const Text(
                      'singhpradu@gmail.com',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12,
                        color: Color(0xFF141414)
                      ),
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
