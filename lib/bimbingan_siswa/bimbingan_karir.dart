import 'package:bk_uji_level_remake/bimbingan_siswa/details/detail_bimbingan_karir.dart';
import 'package:bk_uji_level_remake/form_update_siswa/update_bimbingan_sosial.dart';
import 'package:bk_uji_level_remake/forms_siswa/form_bimbingan_pribadi.dart';
import 'package:bk_uji_level_remake/forms_siswa/form_bimbingan_sosial.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../components/home.dart';
import '../form_update_siswa/update_bimbingan_karir.dart';
import '../form_update_siswa/update_bimbingan_pribadi.dart';
import '../forms_siswa/form_bimbingan_karir.dart';
import 'details/detail_bimbingan_pribadi.dart';
import '../form_update_siswa/update_bimbingan_pribadi.dart';
import 'details/detail_bimbingan_sosial.dart';

class BimbinganKarir extends StatefulWidget {
  final Map<String, dynamic> user;
  const BimbinganKarir({required this.user, Key? key}) : super(key: key);

  @override
  State<BimbinganKarir> createState() => _BimbinganKarirState();
}

class _BimbinganKarirState extends State<BimbinganKarir> {
  List<Map<String, dynamic>> _dataList = [];

  @override
  void initState() {
    super.initState();
    fetchDataFromApi();
  }

  Future<void> fetchDataFromApi() async {
    final response = await http.get(Uri.parse(
        "http://localhost:8000/api/bimbingan_karir/${widget.user["id"]}"));
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
    final response = await http.delete(
        Uri.parse("http://localhost:8000/api/hapus_bimbingan_karir/$id"));
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
          content: const Text(
              "Apakah Anda yakin ingin menghapus bimbingan karir ini?"),
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

  void _navigateToUpdateBimbinganKarir(Map<String, dynamic> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UpdateBimbinganKarir(
          bimbinganData: data,
          user: widget.user,
        ),
      ),
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
                      MaterialPageRoute(
                          builder: (context) => Home(user: widget.user)),
                    );
                  },
                ),
              ),
              const Text(
                "List Bimbingan Karir",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                height: 40,
                decoration: BoxDecoration(
                    color: const Color(0xFF24a8df),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FormBimbinganKarir(user: widget.user)),
                      );
                    },
                    child: const Text("Tambah Bimbingan",
                        style: TextStyle(color: Colors.white, fontSize: 13)),
                  ),
                )),
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
                          style: const TextStyle(
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          data['tanggal_pertemuan'],
                          style: const TextStyle(color: Colors.grey),
                        ),
                        trailing: PopupMenuButton<String>(
                          onSelected: (value) {
                            if (value == 'hapus') {
                              _confirmDeleteDialog(data['id']);
                            } else if (value == 'lihat') {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailBimbinganKarir(
                                        bimbinganData: data,
                                        user: widget.user,
                                      ),
                                ),
                              );
                            } else if (value == 'ubah') {
                              _navigateToUpdateBimbinganKarir(data);
                            }
                          },
                          itemBuilder: (BuildContext context) {
                            return {'Lihat', 'Ubah', 'Hapus'}
                                .map((String choice) {
                              return PopupMenuItem<String>(
                                value: choice.toLowerCase(),
                                child: Text(choice),
                              );
                            }).toList();
                          },
                        ),
                      ),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
