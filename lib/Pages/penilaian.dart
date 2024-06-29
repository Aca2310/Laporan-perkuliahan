import 'package:flutter/material.dart';
import 'package:ui_tb/widget/AppBarWidget.dart';
import 'package:ui_tb/widget/DrawerWidget.dart';
import 'package:ui_tb/widget/nilaiWidget.dart';

class PenilaianPage extends StatefulWidget {
  const PenilaianPage({Key? key}) : super(key: key);

  @override
  _PenilaianPageState createState() => _PenilaianPageState();
}

class _PenilaianPageState extends State<PenilaianPage> {
  late String pertemuan;
  late String meetingId;
  late String courseId;
  late String courseName;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Mengambil argumen dari ModalRoute
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    pertemuan = args['pertemuan'] as String;
    meetingId = args['meetingId'] as String;
    courseId = args['courseId'] as String;
    courseName = args['courseName'] as String;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 600) {
            return Row(
              children: [
                DrawerWidget(), // Sidebar
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(20),
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
                          "Mata Kuliah: $courseName",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 20),
                        Expanded(
                          child: NilaiWidget(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
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
                        "Mata Kuliah: $courseName",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Pertemuan: $pertemuan',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 20),
                      SingleChildScrollView(
                        child: NilaiWidget(),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
      drawer: DrawerWidget(),
    );
  }
}
