import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_tb/widget/AppBarWidget.dart';
import 'package:ui_tb/widget/DrawerWidget.dart';
import 'package:ui_tb/widget/MatkulWidget.dart';

class HomePage extends StatelessWidget {
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
                          "Data Gempa Terakhir",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 20),
                        Expanded(child: EarthquakeWidget()),
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
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20),
                  child: Text(
                    "Data Gempa Terakhir",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                EarthquakeWidget(),
              ],
            );
          }
        },
      ),
      drawer: DrawerWidget(),
    );
  }
}
