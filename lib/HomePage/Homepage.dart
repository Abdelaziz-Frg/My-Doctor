import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_doctor/HomePage/AllSpesialityPage.dart';
import 'package:my_doctor/HomePage/Location/LocationPage.dart';
import 'package:my_doctor/HomePage/Spesiality.dart';
import 'package:my_doctor/HomePage/hospital.dart';
import 'package:my_doctor/Profile/ProfileSettings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            print(value);
            setState(() {
              index = value;
              if (value == 1) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LocationPage()));
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
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String day = "monday", mounth = "July";
  int numday = 26;
  DateTime? specificTime;
  DateTime customTime = DateTime(2024, 1, 1, 15, 30);
  String? formattedTime2;
  String? formattedTime;
  List specialite = [
    {"imgUrl": "healthcare (1).png", "sname": "Cardiology"},
    {"imgUrl": "eye-health (1).png", "sname": "Ophthalmology"},
    {"imgUrl": "ear.png", "sname": "ENT"},
    {"imgUrl": "cross.png", "sname": "Dentistry"},
    {"imgUrl": "orthopedics (1).png", "sname": " Orthopedics"},
  ];

  int number = 5;
  TextEditingController ctext = TextEditingController();

  @override
  void initState() {
    specificTime = DateTime(2024, 6, 26, 15, 30);
    formattedTime2 = "${customTime.minute}";

    formattedTime =
        specificTime != null ? DateFormat.jm().format(specificTime!) : null;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(20),
      child: ListView(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                'Location',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Container(
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: width / 2,
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Color(0xff056CF2),
                      ),
                      Text(
                        'Gulema,Alg',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.grey[200]),
                    child: Icon(
                      Icons.notifications,
                      size: 28,
                    )),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 30),
            child: TextFormField(
              onChanged: (value) {
                setState(() {});
              },
              style: TextStyle(fontSize: 20, color: Colors.black),
              controller: ctext,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: " Search",
                prefixIcon: InkWell(onTap: () {}, child: Icon(Icons.search)),
                hintStyle: TextStyle(fontSize: 18, color: Color(0xFF595959)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xFF056CF2), width: 0.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black, width: 0.5),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Upcomming Schedule',
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xFF056CF2),
                      ),
                      child: Text(
                        '$number',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'See All',
                    style: TextStyle(
                        color: Color(0xFF0554F2),
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFF0554F2),
                        fontSize: 16),
                  ),
                )
              ],
            ),
          ),
          Card(
            color: Color(0xff056CF2),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                          ),
                          Column(
                            children: [
                              Text(
                                ' Dr mossab chaibe',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                ' Dantist Consultation',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100)),
                        child: IconButton(
                            color: Color(0xff056CF2),
                            onPressed: () {},
                            icon: Icon(
                              Icons.phone,
                            )),
                      ),
                    ],
                  ),
                  Container(height: 10),
                  Card(
                    color: Color(0xff0756F2),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            color: Colors.white,
                            size: 28,
                            Icons.calendar_month,
                          ),
                          Text(
                            ' $day $numday $mounth',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          Container(
                            width: 1,
                            height: 20,
                            color: Colors.white,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                          ),
                          Icon(
                            Icons.access_time,
                            color: Colors.white,
                          ),
                          Text(
                            ' $formattedTime',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Doctor speciality',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AllSpesialityPage()));
                  },
                  child: Text(
                    'See All',
                    style: TextStyle(
                        color: Color(0xFF0554F2),
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFF0554F2),
                        fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 130,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: specialite.length,
              itemBuilder: (context, index) {
                return Spesiality(
                  imgUrl: specialite[index]['imgUrl'],
                  text: specialite[index]['sname'],
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Neabry Hospitals',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'See All',
                    style: TextStyle(
                        color: Color(0xFF0554F2),
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFF0554F2),
                        fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 220,
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Hospital(
                    imgUrl: 'images/hosp.jpg',
                    time: formattedTime2.toString(),
                    distense: 1.3);
              },
            ),
          )
        ],
      ),
    );
  }
}
