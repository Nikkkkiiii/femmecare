import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Hospital {
  final String name;
  final String address;
  final String contact;

  Hospital({
    required this.name,
    required this.address,
    required this.contact,
  });
}

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List<LatLng> _hospitalLocations = [];
  List<Hospital> _hospitals = []; // List to store hospital details

  @override
  void initState() {
    super.initState();
    _fetchHospitalLocations();
  }

  Future<void> _fetchHospitalLocations() async {
    // Make a request to Overpass API to fetch hospital data for Itahari
    final response = await http.get(Uri.parse(
        'http://overpass-api.de/api/interpreter?data=[out:json];node["amenity"="hospital"](26.6646,87.2718,26.6746,87.2818);out;'));

    if (response.statusCode == 200) {
      // Parse the response JSON
      final Map<String, dynamic> data = json.decode(response.body);
      if (data.containsKey('elements')) {
        // Extract latitude and longitude coordinates for each hospital
        final List<dynamic> elements = data['elements'];
        _hospitalLocations = elements
            .map((element) => LatLng(
                  element['lat'] as double,
                  element['lon'] as double,
                ))
            .toList();

        // Populate hospitals list with details
        _hospitals = elements.map((element) {
          return Hospital(
            name: element['tags']['name'] ?? 'Unknown',
            address: element['tags']['addr:full'] ?? 'Unknown',
            contact: element['tags']['contact:phone'] ?? 'Unknown',
          );
        }).toList();
        setState(() {});
      }
    }
  }

  // Method to show hospital details
  void _showHospitalInfo(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(_hospitals[index].name),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Address: ${_hospitals[index].address}'),
              Text('Contact: ${_hospitals[index].contact}'),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Find Me"),
          centerTitle: true,
        ),
       body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(26.6646, 87.2718),
          initialZoom: 9.2,
        ),
         
        children: [
          
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
         
        
        ],
      ),
        );
  }
}
