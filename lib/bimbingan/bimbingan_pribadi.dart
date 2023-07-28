import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../components/home.dart';
import 'details/detail_bimbingan_pribadi.dart';

class BimbinganPribadi extends StatefulWidget {
  final Map<String, dynamic> user;
  const BimbinganPribadi({required this.user, Key? key}) : super(key: key);

  @override
  State<BimbinganPribadi> createState() => _BimbinganPribadiState();
}

class _BimbinganPribadiState extends State<BimbinganPribadi> {
  List<Map<String, dynamic>> _dataList = [];

  @override
  void initState() {
    super.initState();
    fetchDataFromApi();
  }

  Future<void> fetchDataFromApi() async {
    final response = await http.get(Uri.parse(
        "http://localhost:8000/api/bimbingan_pribadi/${widget.user["id"]}"));
    if (response.statusCode == 200) {
      final parsedResponse = json.decode(response.body);

      if (parsedResponse['code'] == 200) {
        setState(() {
          _dataList = List<Map<String, dynamic>>.from(parsedResponse['data']);
        });
      } else {
        print("Failed to fetch data from API");
      }
    } else {
      print("Failed to fetch data from API");
    }
  }

  Future<void> deleteDataFromApi(int id) async {
    final response = await http.delete(Uri.parse(
        "http://localhost:8000/api/bimbingan_pribadi/$id"));
    if (response.statusCode == 200) {
      final parsedResponse = json.decode(response.body);

      if (parsedResponse['code'] == 200) {
        // Jika data berhasil dihapus, panggil kembali fetchDataFromApi untuk memuat data terbaru
        fetchDataFromApi();
      } else {
        print("Failed to delete data from API");
      }
    } else {
      print("Failed to delete data from API");
    }
  }

  void _confirmDeleteDialog(int id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Konfirmasi"),
          content: const Text("Apakah Anda yakin ingin menghapus bimbingan pribadi ini?"),
          actions: <Widget>[
            TextButton(
              child: const Text("Batal"),
              onPressed: () {
                  Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Hapus"),
              onPressed: () {
                // Hapus data jika pengguna menekan tombol Hapus
                deleteDataFromApi(id);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Home(user: widget.user)),
                    );
                  },
                ),
              ),
              const Text(
                "List Bimbingan Pribadi",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19
                ),
              )
            ],
          ),
          _dataList.isEmpty
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : Expanded(
            child: ListView.builder(
              itemCount: _dataList.length,
              itemBuilder: (context, index) {
                final data = _dataList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Card(
                    elevation: 3,
                    child: ListTile(
                      title: Text(
                        data['alasan_pertemuan'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        data['tanggal_pertemuan'],
                        style: const TextStyle(color: Colors.grey),
                      ),
                      trailing: PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'delete') {
                            _confirmDeleteDialog(data['id']);
                          } else if (value == 'lihat') {
                            // Tampilkan halaman detail saat pengguna memilih opsi "Lihat"
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailBimbinganPribadi(
                                  bimbinganData: data,
                                  user: widget.user
                                ),
                              ),
                            );
                          }
                        },
                        itemBuilder: (BuildContext context) {
                          return {'Lihat', 'Delete'}.map((String choice) {
                            return PopupMenuItem<String>(
                              value: choice.toLowerCase(),
                              child: Text(choice),
                            );
                          }).toList();
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

