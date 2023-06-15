import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Bimbingan_Pribadi_Details extends StatefulWidget {
  const Bimbingan_Pribadi_Details({Key? key}) : super(key: key);

  @override
  _Bimbingan_Pribadi_DetailsState createState() =>
      _Bimbingan_Pribadi_DetailsState();
}

class _Bimbingan_Pribadi_DetailsState extends State<Bimbingan_Pribadi_Details> {
  int bimbinganPribadiId = 0;
  int selectedIndex = 0;
  Map<String, dynamic> bimbinganPribadiData = {};

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bimbinganPribadiId = ModalRoute.of(context)!.settings.arguments as int;
    print(bimbinganPribadiId);
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://3621-117-102-67-66.ngrok-free.app/api/detail_bimbingan_pribadi/$bimbinganPribadiId'));

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData is List<dynamic> && responseData.isNotEmpty) {
        setState(() {
          bimbinganPribadiData = responseData as Map<String, dynamic>;
        });
      } else {
        setState(() {
          bimbinganPribadiData = responseData as Map<String, dynamic>;
        });
      }
    } else {
      // Handle error
      print('Failed to fetch data');
    }
  }

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
                            Navigator.pushNamed(context, "/bimbingan_pribadi");
                          },
                          icon: const Icon(Icons.arrow_back_ios_new_rounded),
                        ),
                        const SizedBox(
                          width: 9,
                        ),
                        const Text(
                          "Detail Bimbingan Pribadi",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
                          "Nama Siswa",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(bimbinganPribadiData["data"][0]["siswa"]["name"]
                            .toString()),
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
                          "Guru BK",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(bimbinganPribadiData["data"][0]["guru"]["name"]
                            .toString()),
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
                          "Wali Kelas",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(bimbinganPribadiData["data"][0]["walas"]["name"]
                            .toString()),
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
                          "Kelas",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(bimbinganPribadiData["data"][0]["kelas"]["name"]
                            .toString()),
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
                          "Tempat & Tanggal",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            "${bimbinganPribadiData["data"][0]["lokasi_pertemuan"].toString()}, ${bimbinganPribadiData["data"][0]["tanggal_pertemuan"].toString()}"),
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
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Text(bimbinganPribadiData["data"][0]
                                          ["alasan_pertemuan"]
                                      .toString()),
                                ),
                              ],
                            ),
                          ),
                        ),
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
                          "Tanggapan Guru",
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
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Text(bimbinganPribadiData["data"][0]
                                          ["alasan_guru"]
                                      .toString()),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
