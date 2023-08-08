import 'package:bk_uji_level_remake/bimbingan_siswa/bimbingan_pribadi.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../bimbingan_siswa/bimbingan_belajar.dart';

class FormBimbinganBelajar extends StatefulWidget {
  final Map<String, dynamic> user;
  const FormBimbinganBelajar({required this.user, Key? key}) : super(key: key);

  @override
  State<FormBimbinganBelajar> createState() => _FormBimbinganBelajarState();
}

class _FormBimbinganBelajarState extends State<FormBimbinganBelajar> {
  final _formKey = GlobalKey<FormState>();
  final _guruIdController = TextEditingController();
  final _walasIdController = TextEditingController();
  final _alasanPertemuanController = TextEditingController();
  final _tanggalPertemuanController = TextEditingController();
  final _lokasiPertemuanController = TextEditingController();

  @override
  void dispose() {
    _guruIdController.dispose();
    _walasIdController.dispose();
    _alasanPertemuanController.dispose();
    _tanggalPertemuanController.dispose();
    _lokasiPertemuanController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final Map<String, dynamic> requestData = {
        'siswa_id': widget.user["id"],
        'guru_id': _guruIdController.text,
        'walas_id': _walasIdController.text,
        'kelas_id': widget.user["kelas_id"],
        'alasan_pertemuan': _alasanPertemuanController.text,
        'tanggal_pertemuan': _tanggalPertemuanController.text,
        'lokasi_pertemuan': _lokasiPertemuanController.text,
      };

      final response = await http.post(
        Uri.parse("http://localhost:8000/api/tambah_bimbingan_belajar"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(requestData),
      );

      if (response.statusCode == 200) {
        // Data berhasil ditambahkan
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Data berhasil ditambahkan!"),
          ),
        );

        // Bersihkan form setelah data berhasil ditambahkan
        _guruIdController.clear();
        _walasIdController.clear();
        _alasanPertemuanController.clear();
        _tanggalPertemuanController.clear();
        _lokasiPertemuanController.clear();
      } else {
        // Jika terjadi kesalahan saat menambahkan data, Anda dapat menambahkan penanganan kesalahan di sini
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Gagal menambahkan data"),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
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
                            builder: (context) =>
                                BimbinganBelajar(user: widget.user)),
                      );
                    },
                  ),
                  const Text(
                    "Tambah Bimbingan Belajar",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    TextFormField(
                      controller: _guruIdController,
                      decoration: const InputDecoration(labelText: "Guru ID"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Guru ID tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _walasIdController,
                      decoration: const InputDecoration(labelText: "Walas ID"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Walas ID tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _alasanPertemuanController,
                      decoration: const InputDecoration(labelText: "Alasan Pertemuan"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Alasan Pertemuan tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _tanggalPertemuanController,
                      decoration: const InputDecoration(labelText: "Tanggal Pertemuan"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Tanggal Pertemuan tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _lokasiPertemuanController,
                      decoration: const InputDecoration(labelText: "Lokasi Pertemuan"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Lokasi Pertemuan tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: _submitForm,
                        child: const Text("Submit"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
