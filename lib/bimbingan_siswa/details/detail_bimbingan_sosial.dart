import 'package:flutter/material.dart';

import '../bimbingan_pribadi.dart';
import '../bimbingan_sosial.dart';

class DetailBimbinganSosial extends StatefulWidget {
  final Map<String, dynamic> bimbinganData, user;

  const DetailBimbinganSosial({
    required this.bimbinganData,
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  State<DetailBimbinganSosial> createState() => _DetailBimbinganSosialState();
}

class _DetailBimbinganSosialState extends State<DetailBimbinganSosial> {
  // Helper method to handle null values and return an empty string
  String _nullSafeText(dynamic value) {
    return value?.toString() ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BimbinganSosial(user: widget.user),
                          ),
                        );
                      },
                    ),
                    const Text(
                      "Detail Bimbingan Sosial",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      const Text(
                        'Alasan Pertemuan',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      const Spacer(),
                      Text(
                        _nullSafeText(widget.bimbinganData['status']),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_nullSafeText(widget.bimbinganData['alasan_pertemuan'])),
                      const SizedBox(height: 20),
                      const Text(
                        'Tanggal Pertemuan',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      const SizedBox(height: 8),
                      Text(_nullSafeText(widget.bimbinganData['tanggal_pertemuan'])),
                      const SizedBox(height: 20),
                      const Text(
                        'Lokasi Pertemuan',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      const SizedBox(height: 8),
                      Text(_nullSafeText(widget.bimbinganData['lokasi_pertemuan'])),
                      const SizedBox(height: 20),
                      const Text(
                        'Hasil Pertemuan',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      const SizedBox(height: 8),
                      Text(_nullSafeText(widget.bimbinganData['alasan_guru'])),
                      const SizedBox(height: 20),
                      const Text(
                        'Nama Siswa',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      const SizedBox(height: 8),
                      Text(_nullSafeText(widget.bimbinganData['siswa']['name'])),
                      const SizedBox(height: 20),
                      const Text(
                        'Orang Yang Bersangkutan',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      const SizedBox(height: 8),
                      Text(_nullSafeText(widget.bimbinganData['diajukan'].toString())),
                      const SizedBox(height: 20),
                      const Text(
                        'Kelas Siswa',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      const SizedBox(height: 8),
                      Text(_nullSafeText(widget.bimbinganData['kelas']['name'])),
                      const SizedBox(height: 20),
                      const Text(
                        'Guru BK Siswa',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      const SizedBox(height: 8),
                      Text(_nullSafeText(widget.bimbinganData['guru']['name'])),
                      const SizedBox(height: 20),
                      const Text(
                        'Wali Kelas Siswa',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      const SizedBox(height: 8),
                      Text(_nullSafeText(widget.bimbinganData['walas']['name'])),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
