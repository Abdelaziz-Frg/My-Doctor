import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:location/location.dart';
import 'package:my_doctor/Booking/BookingPage.dart';
import 'package:my_doctor/HomePage/Homepage.dart';
import 'package:my_doctor/Profile/ProfileSettings.dart';
import 'package:latlong2/latlong.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final MapController mapController = MapController();
  LocationData? currentLocation;
  List<LatLng> routePoints = [];
  List<Marker> markers = [];
  LocationData currentLocation2 = LocationData.fromMap({
    'latitude': 36.901997,
    'longitude': 7.74643,
  });
  final String orsApikey =
      "5b3ce3597851110001cf6248f99205f6cacb4e51b527a15d86c85c54";
      StreamSubscription<LocationData>? locationSubscription; 
      
      
  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }
  @override
  void dispose() {
    saveLocation(currentLocation!.latitude!, currentLocation!.longitude!);
    locationSubscription?.cancel(); 
    super.dispose();
  }

  int index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            print(value);
            setState(() {
              index = value;
              if (value == 0) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage()));
              }
              if (value == 2) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => BookingPage()));
              }
              if (value == 4) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Profilesettings()));
              }
            });
          },
          currentIndex: index,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xff0554F2),
          unselectedIconTheme: IconThemeData(
            color: Color(0xffBFBFBF),
          ),
          selectedIconTheme: IconThemeData(size: 30),
          selectedFontSize: 16,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.location_on), label: "Explore"),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_book), label: "Booking"),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ]),
      body: currentLocation == null
          ? const Center(child: CircularProgressIndicator())
          : FlutterMap(
              mapController: mapController,
              children: [
                TileLayer(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayer(markers: markers),
                PolylineLayer(polylines: [
                  Polyline(
                    points: routePoints,
                    strokeWidth: 4.0,
                    color: Colors.blue,
                  )
                ]),
              ],
              options: MapOptions(
                  // initialCenter: LatLng(
                  //     currentLocation!.latitude!, currentLocation!.longitude!),

                  // initialCenter: LatLng(36.901997, 7.74643),

                  // initialCenter: LatLng(
                  //     currentLocation!.latitude!, currentLocation!.longitude!),
                  initialCenter: currentLocation != null
    ? LatLng(currentLocation!.latitude!, currentLocation!.longitude!)
    : LatLng(36.901997, 7.74643),
                  initialZoom: 17.0,
                  onTap: (topPosition, point) => _addDistinationMarker(point)),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (currentLocation != null) {
            mapController.move(
                LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
                17.0);
            double disten = calculateDistance(
                currentLocation!.latitude!,
                currentLocation!.longitude!,
                currentLocation2.latitude!,
                currentLocation2.longitude!);
            print("${disten.toStringAsFixed(2)} Km");
          }
        },
        child: Icon(
          Icons.my_location,
          color: Colors.blue,
        ),
      ),
    );
  }

  Future<void> _getCurrentLocation() async {
    var location = Location();
    try {
      var userLocation = await Location().getLocation();
      setState(() {
        if (userLocation != null) {
          markers.add(Marker(
              point: LatLng(userLocation.latitude!, userLocation.longitude!),
              width: 80.0,
              height: 80.0,
              child: const Icon(
                Icons.my_location,
                color: Colors.blue,
                size: 40,
              )));
          currentLocation = userLocation;
        }
      });
    } on Exception {
      currentLocation = null;
    }
    locationSubscription = location.onLocationChanged.listen((LocationData newLocation) {
      setState(() {
        currentLocation = newLocation;
      });
    });
  }

  Future _getRoute(LatLng destination) async {
    if (currentLocation == null) return;
    final start =
        LatLng(currentLocation!.latitude!, currentLocation!.longitude!);
    final response = await http.get(Uri.parse(
        "https://api.openrouteservice.org/v2/directions/driving-car?api_key=$orsApikey&start=${start.longitude},${start.latitude}&end=${destination.longitude},${destination.latitude}"));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> coords =
          data['features'][0]['geometry']['coordinates'];
      setState(() {
        routePoints =
            coords.map((coord) => LatLng(coord[1], coord[0])).toList();
        markers.add(Marker(
            point: destination,
            child: const Icon(
              Icons.my_location,
              color: Colors.red,
              size: 40,
            ),
            width: 80.0,
            height: 80.0));
      });
    } else
      print('faile to fetch route');
  }

  void _addDistinationMarker(LatLng point) {
    setState(() {
         if (markers.isNotEmpty) {
        markers = [markers.first];
      }
      markers.add(Marker(
          point: point,
          child: const Icon(
            Icons.my_location,
            color: Colors.red,
            size: 40,
          ),
          width: 80.0,
          height: 80.0));
      double disten = calculateDistance(
          currentLocation!.latitude!,
          currentLocation!.longitude!,
          currentLocation2.latitude!,
          currentLocation2.longitude!);
      if (currentLocation != null) {
        double distance = calculateDistance(currentLocation!.latitude!,
            currentLocation!.longitude!, point.latitude, point.longitude);
        print(
            'Distance to the new location: ${distance.toStringAsFixed(2)} km');
      }
    });
    _getRoute(point);
  }

  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const double radius = 6371; // نصف قطر الأرض بالكيلومتر

    // تحويل الدرجات إلى راديان
    double lat1Rad = _toRadians(lat1);
    double lon1Rad = _toRadians(lon1);
    double lat2Rad = _toRadians(lat2);
    double lon2Rad = _toRadians(lon2);

    // حساب الفروق بين الإحداثيات
    double deltaLat = lat2Rad - lat1Rad;
    double deltaLon = lon2Rad - lon1Rad;

    // تطبيق صيغة Haversine
    double a = sin(deltaLat / 2) * sin(deltaLat / 2) +
        cos(lat1Rad) * cos(lat2Rad) * sin(deltaLon / 2) * sin(deltaLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    // حساب المسافة
    return radius * c; // المسافة بالكيلومتر
  }

// تحويل الدرجات إلى راديان
  double _toRadians(double degree) {
    return degree * pi / 180.0;
  }

  Future<void> saveLocation(double latitude, double longitude) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setDouble('latitude', latitude);
  prefs.setDouble('longitude', longitude);
}
  
}
