import 'package:bk_uji_level_remake/bimbingan/bimbingan_sosial.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FormBimbinganSosial extends StatefulWidget {
  final Map<String, dynamic> user;
  const FormBimbinganSosial({required this.user, Key? key}) : super(key: key);

  @override
  State<FormBimbinganSosial> createState() => _FormBimbinganSosialState();
}

class _FormBimbinganSosialState extends State<FormBimbinganSosial> {
  final _formKey = GlobalKey<FormState>();
  final _alasanPertemuanController = TextEditingController();
  final _tanggalPertemuanController = TextEditingController();
  final _lokasiPertemuanController = TextEditingController();

  List<Map<String, dynamic>> _guruData = [];
  List<Map<String, dynamic>> _walasData = [];
  List<Map<String, dynamic>> _siswaData = [];

  String? _selectedGuruId;
  String? _selectedWalasId;
  String? _selectedSiswaId;


  @override
  void initState() {
    _fetchGuruData();
    _fetchWalasData();
    _fetchSiswaData();
    super.initState();
  }

  // Method to fetch guru data from the API
  Future<void> _fetchGuruData() async {
    try {
      final response = await http.get(
        Uri.parse("http://localhost:8000/api/get_guru"),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        setState(() {
          _guruData = List<Map<String, dynamic>>.from(json.decode(response.body)["data"]);
        });
      } else {
        // Handle API error here
        print("Error: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      // Handle other exceptions
      print("Error: $e");
    }
  }

  Future<void> _fetchWalasData() async {
    try {
      final response = await http.get(
        Uri.parse("http://localhost:8000/api/get_walas"),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        setState(() {
          _walasData = List<Map<String, dynamic>>.from(json.decode(response.body)["data"]);
        });
      } else {
        // Handle API error here
        print("Error: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      // Handle other exceptions
      print("Error: $e");
    }
  }

  Future<void> _fetchSiswaData() async {
    try {
      final response = await http.get(
        Uri.parse("http://localhost:8000/api/get_siswa"),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        setState(() {
          _siswaData = List<Map<String, dynamic>>.from(json.decode(response.body)["data"]);
        });
      } else {
        // Handle API error here
        print("Error: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      // Handle other exceptions
      print("Error: $e");
    }
  }

  @override
  void dispose() {
    _alasanPertemuanController.dispose();
    _tanggalPertemuanController.dispose();
    _lokasiPertemuanController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final Map<String, dynamic> requestData = {
        'siswa_id': widget.user["id"],
        'guru_id': _selectedGuruId ?? '',
        'walas_id': _selectedWalasId ?? '',
        'kelas_id': widget.user["kelas_id"],
        'alasan_pertemuan': _alasanPertemuanController.text,
        'tanggal_pertemuan': _tanggalPertemuanController.text,
        'lokasi_pertemuan': _lokasiPertemuanController.text,
        'diajukan': _selectedWalasId ?? ''
      };

      print('requestData: $requestData');

      final response = await http.post(
        Uri.parse("http://localhost:8000/api/tambah_bimbingan_sosial"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(requestData),
      );

      print('Response Status Code: ${response.statusCode}');

      // Rest of your code...

      if (response.statusCode == 200) {
        // Data berhasil ditambahkan
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Data berhasil ditambahkan!"),
          ),
        );

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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                                  BimbinganSosial(user: widget.user)),
                        );
                      },
                    ),
                    const Text(
                      "Tambah Bimbingan Sosial",
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
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(labelText: "Guru BK"),
                        value: _selectedGuruId,
                        items: _guruData.map((guru) {
                          return DropdownMenuItem<String>(
                            value: guru["id"].toString(),
                            child: Text(guru["name"]),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedGuruId = newValue;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Guru ID tidak boleh kosong";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(labelText: "Wali Kelas"),
                        value: _selectedWalasId,
                        items: _walasData.map((walas) {
                          return DropdownMenuItem<String>(
                            value: walas["id"].toString(),
                            child: Text(walas["name"]),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedWalasId = newValue;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Walas tidak boleh kosong";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(labelText: "Orang Yang Bersangkutan"),
                        value: _selectedSiswaId,
                        items: _siswaData.map((siswa) {
                          return DropdownMenuItem<String>(
                            value: siswa["id"].toString(),
                            child: Text(siswa["name"]),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedSiswaId = newValue;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Orang yang bersangkutan tidak boleh kosong";
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
      ),
    );
  }
}
