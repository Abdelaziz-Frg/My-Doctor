import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:my_doctor/HomePage/Homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Yourlocation extends StatelessWidget {
  const Yourlocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body3(),
    );
  }
}

class Body3 extends StatefulWidget {
  const Body3({super.key});

  @override
  State<Body3> createState() => _Body3State();
}

class _Body3State extends State<Body3> {
  LocationData? currentLocation;
  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return Container(
      width: wid,
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            height: hei / 8,
            margin: EdgeInsets.only(top: hei / 5, bottom: 40),
            child: ClipOval(child: Image.asset('images/location2.png')),
          ),
          Container(
            child: Text(
              'What is Your Location?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 60),
            child: Text(
              'we need to know your location in order to suggest\n nearby servises.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Color(0x99595959),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 40, top: 30),
            child: MaterialButton(
              color: Color(0xff0554F2),
              padding: EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                _getCurrentLocation2();
              },
              child: Text(
                'Allow Location Access',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Text(
              'Enter Location Manually',
              style: TextStyle(
                color: Color(0xff0554F2),
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _getCurrentLocation2() async {
    var location = Location();
    try {
      var userLocation = await Location().getLocation();
      setState(() {
        if (userLocation != null) {
          // markers.add(Marker(
          //     point: LatLng(userLocation.latitude!, userLocation.longitude!),
          //     width: 80.0,
          //     height: 80.0,
          //     child: const Icon(
          //       Icons.my_location,
          //       color: Colors.blue,
          //       size: 40,
          //     )));
          currentLocation = userLocation;
          saveLocation(currentLocation!.latitude!, currentLocation!.longitude!);
          print('${currentLocation!.latitude!} ${currentLocation!.longitude!}');
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomePage()));
        }
      });
    } on Exception {
      currentLocation = null;
    }
    // locationSubscription = location.onLocationChanged.listen((LocationData newLocation) {
    //   setState(() {
    //     currentLocation = newLocation;
    //   });
    // });
  }

  Future<void> saveLocation(double latitude, double longitude) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('latitude', latitude);
    prefs.setDouble('longitude', longitude);
  }
}
