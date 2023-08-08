import 'package:bk_uji_level_remake/components/opction.dart';
import 'package:bk_uji_level_remake/components/profile.dart';
import 'package:bk_uji_level_remake/components/splash.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../bimbingan_siswa/bimbingan_karir.dart';
import '../bimbingan_siswa/bimbingan_sosial.dart';
import '../bimbingan_siswa/bimbingan_belajar.dart';
import '../bimbingan_siswa/bimbingan_pribadi.dart';
import 'login_guru.dart';

class HomeGuru extends StatefulWidget {
  final Map<String, dynamic> user;
  const HomeGuru({required this.user, Key? key}) : super(key: key);

  @override
  State<HomeGuru> createState() => _HomeGuruState();
}

class _HomeGuruState extends State<HomeGuru> {
  int bimbinganPribadiCount = 0;
  int bimbinganBelajarCount = 0;
  int bimbinganSosialCount = 0;
  int bimbinganKarirCount = 0;

  int selectedIndex = 0;
  final int _currentPageIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _fetchBimbinganPribadiCount();
    _fetchBimbinganBelajarCount();
    _fetchBimbinganSosialCount();
    _fetchBimbinganKarirCount();
  }

  void _fetchBimbinganPribadiCount() async {
    Uri uri = Uri.parse('http://127.0.0.1:8000/api/count_bimbingan_pribadi/${widget.user["id"]}');

    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      int count = responseData['data'];

      setState(() {
        bimbinganPribadiCount = count;
      });
    } else {
      // Handle the error if necessary
    }
  }

  void _fetchBimbinganBelajarCount() async {
    Uri uri = Uri.parse('http://127.0.0.1:8000/api/count_bimbingan_belajar/${widget.user["id"]}');

    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      int count = responseData['data'];

      setState(() {
        bimbinganBelajarCount = count;
      });
    } else {
      // Handle the error if necessary
    }
  }

  void _fetchBimbinganSosialCount() async {
    Uri uri = Uri.parse('http://127.0.0.1:8000/api/count_bimbingan_sosial/${widget.user["id"]}');

    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      int count = responseData['data'];

      setState(() {
        bimbinganSosialCount = count;
      });
    } else {
      // Handle the error if necessary
    }
  }

  void _fetchBimbinganKarirCount() async {
    Uri uri = Uri.parse('http://127.0.0.1:8000/api/count_bimbingan_karir/${widget.user["id"]}');

    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      int count = responseData['data'];

      setState(() {
        bimbinganKarirCount = count;
      });
    } else {
      // Handle the error if necessary
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                         Padding(
                           padding: const EdgeInsets.only(left: 25),
                           child: Expanded(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () {
                                    _scaffoldKey.currentState?.openDrawer();
                                  },
                                  child: const Icon(
                                    Icons.menu,
                                    size: 32,
                                    color: Colors.white,
                                  ),
                                )),
                         ),
                            SizedBox(width: 0),
                          Expanded(
                            flex: 10,
                            child: Text(
                              "Selamat Datang, ${widget.user["name"]}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                              
                            ),
                          ),
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
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 8),
                            child: const Text(
                                "Total Bimbingan",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                )
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Text(
                                      bimbinganPribadiCount.toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    const Text(
                                      "Pribadi",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Text(
                                      bimbinganBelajarCount.toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    const Text(
                                      "Belajar",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Text(
                                      bimbinganSosialCount.toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    const Text(
                                      "Sosial",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Text(
                                      bimbinganKarirCount.toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    const Text(
                                      "Karir",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
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
                                MaterialPageRoute(builder: (context) => BimbinganBelajar(user: widget.user,)),
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
                                MaterialPageRoute(builder: (context) => BimbinganSosial(user: widget.user)),
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
                                MaterialPageRoute(builder: (context) => BimbinganKarir(user: widget.user)),
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFFF6F6F6),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFF24a8df)),
              accountName: GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Profile(user: widget.user)),
                  );
                },
                child: Text(
                  widget.user["name"],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                      letterSpacing: 1,
                      color: Color(0xFFFFFFFF)),
                ),
              ),
              accountEmail: Text(
                widget.user["email"],
                style: const TextStyle(fontSize: 12, color: Color(0xFFFFFFFF)),
              ),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset(
                    "assets/image.png",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Add your logic for when the Page 1 item is tapped
                // For example, you might want to navigate to a different page or perform some action.
              },
              selected: _currentPageIndex == 0,
              selectedTileColor: const Color(0xFFF0F0F0),
            ),
            ListTile(
              leading: const Icon(Icons.logout_rounded),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => opction()),
                );
              },
              selected: _currentPageIndex == 1,
              selectedTileColor: const Color(0xFFF0F0F0),
            ),
          ],
        ),
      ),
    );
  }
}
