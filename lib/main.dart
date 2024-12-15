import 'package:flutter/material.dart';
import 'package:my_doctor/HomePage/DoctorDetailsPage.dart';
import 'package:my_doctor/HomePage/Homepage.dart';
import 'package:my_doctor/HomePage/Location/LocationPage.dart';
import 'package:my_doctor/HomePage/Location/YourLocation.dart';
import 'package:my_doctor/Login/LoginPage.dart';
import 'package:my_doctor/Login/Sinup.dart';
import 'package:my_doctor/Login/Verification.dart';
import 'package:my_doctor/Profile/ProfileSettings.dart';
import 'package:my_doctor/Profile/infoProfile.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            size: 25
          )
        ),
      ),
      debugShowCheckedModeBanner: false,
      // home: InfoprofilePage(),
      // home: VerificationPage(email: "example@gmil.com",),
      // home: LoginPage(),
      home: HomePage(),
      // home: Profilesettings(),
      // home: LocationPage(),
      // home: Yourlocation(),
      // home: DoctorDetailsPage(name: "data",
      // speciality: "data",
      // city:  "New York",
      // country: "USA",),
    );
  }
}