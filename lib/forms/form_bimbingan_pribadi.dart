import 'package:bk_uji_level_remake/forms/form_portal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FormBimbinganPribadi extends StatefulWidget {
  final Map<String, dynamic> user;
  const FormBimbinganPribadi({required this.user, Key? key}) : super(key: key);

  @override
  State<FormBimbinganPribadi> createState() => _FormBimbinganPribadiState();
}

class _FormBimbinganPribadiState extends State<FormBimbinganPribadi> {
  final _formKey = GlobalKey<FormState>();
  final _guruIdController = TextEditingController();
  final _walasIdController = TextEditingController();
  final _kelasIdController = TextEditingController();
  final _alasanPertemuanController = TextEditingController();
  final _tanggalPertemuanController = TextEditingController();
  final _lokasiPertemuanController = TextEditingController();

  @override
  void dispose() {
    _guruIdController.dispose();
    _walasIdController.dispose();
    _kelasIdController.dispose();
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
        'kelas_id': _kelasIdController.text,
        'alasan_pertemuan': _alasanPertemuanController.text,
        'tanggal_pertemuan': _tanggalPertemuanController.text,
        'lokasi_pertemuan': _lokasiPertemuanController.text,
      };

      final response = await http.post(
        Uri.parse("http://localhost:8000/api/tambah_bimbingan_pribadi"),
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
        _kelasIdController.clear();
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
              TextButton(onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => FormPortal(user: widget.user)),
                );
              }, child: Text("back")),

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
              TextFormField(
                controller: _kelasIdController,
                decoration: const InputDecoration(labelText: "Kelas ID"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Kelas ID tidak boleh kosong";
                  }
                  return null;
                },
              ),
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
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
