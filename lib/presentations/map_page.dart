import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  late String searchAddr;
  Set<Marker> _markers = {}; // Set to hold markers

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: onMapCreated,
              initialCameraPosition: const CameraPosition(
                target: LatLng(26.674041, 87.1827975),
                zoom: 10.0,
              ),
              markers: _markers, // Add markers to the map
            ),
            Positioned(
              top: 30.0,
              right: 15.0,
              left: 15.0,
              child: Container(
                height: 50.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Address',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search_rounded),
                      onPressed: () {
                        searchAndNavigate(); // Call searchAndNavigate method here
                      },
                      iconSize: 30.0,
                    ),
                  ),
                  onChanged: (val) {
                    setState(() {
                      searchAddr = val;
                    });
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
    _addHospitalMarkers(); // Call a method to add hospital markers
  }

  void _addHospitalMarkers() {
    // Example data for hospitals in Itahari
    List<Map<String, dynamic>> hospitals = [
      {
        'name': 'Itahari Hospital',
        'latitude': 26.6646041,
        'longitude': 87.2714023,
      },
      {
        'name': 'Hospital B',
        'latitude': 26.6646091,
        'longitude': 87.2713864,
      },
      {
        'name': 'Hospital C',
        'latitude': 26.6646091,
        'longitude': 87.2713864,
      },
      {
        'name': 'Hospital D',
        'latitude': 26.6670911,
        'longitude': 87.2674513,
      }
      // Add more hospitals here
    ];

    // Clear existing markers
    setState(() {
      _markers.clear();
    });

    for (var hospital in hospitals) {
      final markerId = MarkerId(hospital['name']);
      final marker = Marker(
        markerId: markerId,
        position: LatLng(hospital['latitude'], hospital['longitude']),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        infoWindow: InfoWindow(title: hospital['name'],
                              snippet: hospital['address']),

        onTap: (){
          _showHospitalInfo(hospital);
        }
      );

      setState(() {
        _markers.add(marker);
      });
    }
  }

  void _showHospitalInfo(Map<String, dynamic> hospitalData) async{
      List<Placemark> placemarks = await placemarkFromCoordinates(
    hospitalData['latitude'],
    hospitalData['longitude'],
  );


  if (placemarks.isNotEmpty) {
    Placemark placemark = placemarks.first;
    hospitalData['address'] = placemark.locality ?? 'Unknown Address';
    hospitalData['city'] = placemark.subAdministrativeArea ?? '';



    showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(hospitalData['name']),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Address: ${hospitalData['address']}, ${hospitalData['city']}'),
            // Add more information as needed
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

    else {
    // Handle case where address couldn't be fetched
    print('Address not available');
  }

    

}


  void searchAndNavigate() {
    if (searchAddr.isEmpty) return; // Check if searchAddr is empty

    locationFromAddress(searchAddr).then((result) {
      if (result.isNotEmpty) {
        mapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              result[0].latitude,
              result[0].longitude,
            ),
            zoom: 10.0,
          ),
        ));
      }
    });
  }
}
