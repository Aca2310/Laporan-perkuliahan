import 'package:flutter/material.dart';
import 'package:ui_tb/Pages/HomePage.dart';
import 'package:ui_tb/Pages/KelasPage.dart';
import 'package:ui_tb/Pages/historynilai.dart';
import 'package:ui_tb/Pages/historypermasalahan.dart';
import 'package:ui_tb/Pages/login.dart';
import 'package:ui_tb/Pages/penilaian.dart';
import 'package:ui_tb/Pages/permasalahan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'KuliahQ',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFFF5FF3),
        ),
        routes: {
          "/": (context) => LoginPage(),
          "Home": (context) => HomePage(),
          "kelas": (context) => KelasPage(),
          "penilaian": (context) => PenilaianPage(),
          "permasalahan": (context) => Permasalahan(),
          "Historypermasalah": (context) => HistoryPermasalahanPage(),
          "HistoryNilai": (context) => HistoryNilaiPage(),
        });
  }
}
