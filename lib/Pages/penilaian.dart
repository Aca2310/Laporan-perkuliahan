import 'package:flutter/material.dart';
import 'package:ui_tb/widget/AppBarWidget.dart';
import 'package:ui_tb/widget/DrawerWidget.dart';
import 'package:ui_tb/widget/nilaiWidget.dart';

class PenilaianPage extends StatefulWidget {
  final String pertemuan;

  PenilaianPage({required this.pertemuan});

  @override
  _PenilaianPageState createState() => _PenilaianPageState();
}

class _PenilaianPageState extends State<PenilaianPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          AppBarWidget(),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Form Penilaian",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  widget.pertemuan,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "SI621400 - Audit Sistem Informasi",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          NilaiWidget(),
        ], // Close the children list of ListView
      ), // Close the ListView
      drawer: DrawerWidget(),
    );
  }
}
