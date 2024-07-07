import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EarthquakeWidget extends StatefulWidget {
  @override
  _EarthquakeWidgetState createState() => _EarthquakeWidgetState();
}

class _EarthquakeWidgetState extends State<EarthquakeWidget> {
  List<Earthquake> earthquakes = [];

  @override
  void initState() {
    super.initState();
    fetchEarthquakeData();
  }

  Future<void> fetchEarthquakeData() async {
    try {
      final url = Uri.parse(
          'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/significant_month.geojson');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        List<Earthquake> fetchedEarthquakes = [];
        final jsonData = jsonDecode(response.body);

        List<dynamic> features = jsonData['features'];

        for (var feature in features) {
          fetchedEarthquakes.add(Earthquake.fromJson(feature));
        }

        setState(() {
          earthquakes = fetchedEarthquakes;
        });
      } else {
        throw Exception('Failed to load earthquake data');
      }
    } catch (e) {
      print('Error fetching earthquake data: $e');
      // Handle error accordingly
    }
  }

  Widget _buildEarthquakeCard(BuildContext context, Earthquake earthquake) {
    double screenWidth = MediaQuery.of(context).size.width;
    double boxWidth = screenWidth * 0.9; // Using 90% of screen width

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {
          // Handle tap if needed
        },
        child: Container(
          width: boxWidth,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              const SizedBox(width: 10),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Magnitude: ${earthquake.magnitude}',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Location: ${earthquake.place}',
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 11),
                      Text(
                        'Time: ${earthquake.time}',
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: earthquakes.map((earthquake) {
            return _buildEarthquakeCard(
              context,
              earthquake,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class Earthquake {
  final double magnitude;
  final String place;
  final String time;

  Earthquake({
    required this.magnitude,
    required this.place,
    required this.time,
  });

  factory Earthquake.fromJson(Map<String, dynamic> json) {
    return Earthquake(
      magnitude: json['properties']['mag'].toDouble(),
      place: json['properties']['place'],
      time: DateTime.fromMillisecondsSinceEpoch(json['properties']['time'])
          .toString(),
    );
  }
}
