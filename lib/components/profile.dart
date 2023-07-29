import 'package:bk_uji_level_remake/components/home.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  final Map<String, dynamic> user;
  const Profile({required this.user, Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(user: widget.user),
                      ),
                    );
                  },
                ),
                Text(
                  "Profil Pengguna ${widget.user["name"]}",
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
          Column(
              children: [
                const SizedBox(height: 20),
                Image.asset("assets/image.png"),
                const SizedBox(height: 8),
              ]
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Nama',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                const SizedBox(height: 8),
                Text(_nullSafeText(widget.user['name'])),
                const SizedBox(height: 20),
                const Text(
                  'Email',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                const SizedBox(height: 8),
                Text(_nullSafeText(widget.user['email'])),
                const SizedBox(height: 20),
                const Text(
                  'NISN',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                const SizedBox(height: 8),
                Text(_nullSafeText(widget.user['nisn'])),
                const SizedBox(height: 20),
                const Text(
                  'Tanggal Bergabung',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                const SizedBox(height: 8),
                Text(_nullSafeText(widget.user['created_at'])),
              ],
            ),
          )
        ],
      )
    );
  }
}
