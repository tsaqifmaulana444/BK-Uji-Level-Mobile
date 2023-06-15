import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Bimbingan_Pribadi extends StatefulWidget {
  const Bimbingan_Pribadi({Key? key}) : super(key: key);

  @override
  State<Bimbingan_Pribadi> createState() => _Bimbingan_PribadiState();
}

class _Bimbingan_PribadiState extends State<Bimbingan_Pribadi> {
  List<dynamic> bimbinganPribadiData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    // user = ModalRoute.of(context)?.settings.arguments as Map;
    final response = await http.get(Uri.parse(
        'https://3621-117-102-67-66.ngrok-free.app/api/bimbingan_pribadi/1'));

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      setState(() {
        bimbinganPribadiData = responseData['data'];
      });
    } else {
      // Handle error
      print('Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)?.settings.arguments;
    print(user);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFF3F3F3),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Center(
              child: Column(
                children: [
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
                          icon: const Icon(Icons.arrow_back_ios_new_rounded),
                        ),
                        const SizedBox(
                          width: 9,
                        ),
                        const Text(
                          "List Bimbingan Pribadi",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
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
                      children: bimbinganPribadiData.map((item) {
                        return Container(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 200,
                                      margin: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        item['alasan_pertemuan'],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 18),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Nama Siswa : ${item['siswa']['name']}",
                                            // item['guru_id'].toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                        "Tanggal : ${item['tanggal_pertemuan']}"),
                                    Text("Stasus : ${item['status']}"),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.only(right: 15),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      "/bimbingan_pribadi/details",
                                      arguments: item['id'],
                                    );
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color(0xFFcb0c9f)),
                                  ),
                                  child: const Text(
                                    "Detail",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
