import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../bimbingan_siswa/bimbingan_pribadi.dart';

class UpdateBimbinganPribadi extends StatefulWidget {
  final Map<String, dynamic> bimbinganData;
  final Map<String, dynamic> user;

  const UpdateBimbinganPribadi({
    required this.bimbinganData,
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  State<UpdateBimbinganPribadi> createState() => _UpdateBimbinganPribadiState();
}

class _UpdateBimbinganPribadiState extends State<UpdateBimbinganPribadi> {
  final TextEditingController _alasanController = TextEditingController();
  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _lokasiController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _alasanController.text = widget.bimbinganData['alasan_pertemuan'];
    _tanggalController.text = widget.bimbinganData['tanggal_pertemuan'];
    _lokasiController.text = widget.bimbinganData['lokasi_pertemuan'];

  }

  Future<void> updateDataToApi() async {
    final url = "http://localhost:8000/api/ubah_bimbingan_pribadi/${widget.bimbinganData['id']}";
    final body = {
      'alasan_pertemuan': _alasanController.text,
      'tanggal_pertemuan': _tanggalController.text,
      'lokasi_pertemuan': _lokasiController.text,

      // Jika ada field lain yang ingin diperbarui, tambahkan di sini
    };

    final response = await http.put(Uri.parse(url), body: body);

    if (response.statusCode == 200) {
      final parsedResponse = json.decode(response.body);

      if (parsedResponse['code'] == 200) {
        // Data berhasil diperbarui, kembali ke halaman sebelumnya
        Navigator.pop(context);
      } else {
        print("Failed to update data to API");
      }
    } else {
      print("Failed to update data to API");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              BimbinganPribadi(user: widget.user)),
                    );
                  },
                ),
                const Text(
                  "Ubah Bimbingan Pribadi",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _alasanController,
                    decoration: const InputDecoration(labelText: 'Alasan Pertemuan'),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _tanggalController,
                    decoration: const InputDecoration(labelText: 'Tanggal Pertemuan'),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _lokasiController,
                    decoration: const InputDecoration(labelText: 'Lokasi Pertemuan'),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        updateDataToApi();
                      },
                      child: const Text('Update Data'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
