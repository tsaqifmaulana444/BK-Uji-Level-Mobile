import 'package:bk_uji_level_remake/bimbingan/bimbingan_pribadi.dart';
import 'package:flutter/material.dart';

class DetailBimbinganPribadi extends StatefulWidget {
  final Map<String, dynamic> bimbinganData, user;

  const DetailBimbinganPribadi({
    required this.bimbinganData,
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  State<DetailBimbinganPribadi> createState() => _DetailBimbinganPribadiState();
}

class _DetailBimbinganPribadiState extends State<DetailBimbinganPribadi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => BimbinganPribadi(user: widget.user)),
              );
            }, child: Text("back")),
            const SizedBox(height: 8),
            Text(
              'Alasan Pertemuan: ${widget.bimbinganData['alasan_pertemuan']}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Tanggal Pertemuan: ${widget.bimbinganData['tanggal_pertemuan']}'),
            const SizedBox(height: 8),
            Text('Lokasi Pertemuan: ${widget.bimbinganData['lokasi_pertemuan']}'),
            const SizedBox(height: 8),
            Text('Solusi Guru: ${widget.bimbinganData['solusi_guru']}'),
            const SizedBox(height: 8),
            Text('Alasan Guru: ${widget.bimbinganData['alasan_guru']}'),
            const SizedBox(height: 8),
            Text('Status: ${widget.bimbinganData['status']}'),
          ],
        ),
      ),
    );
  }
}
