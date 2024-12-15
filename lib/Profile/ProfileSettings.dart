import 'package:flutter/material.dart';
import 'package:my_doctor/Booking/BookingPage.dart';
import 'package:my_doctor/HomePage/Homepage.dart';
import 'package:my_doctor/HomePage/Location/LocationPage.dart';
import 'package:my_doctor/Profile/ModifyProfile.dart';
import 'package:my_doctor/Profile/SettingsPage.dart';

class Profilesettings extends StatefulWidget {
  const Profilesettings({super.key});

  @override
  State<Profilesettings> createState() => _ProfilesettingsState();
}

class _ProfilesettingsState extends State<Profilesettings> {
  int index = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            print(value);
            setState(() {
              index = value;
              if (value == 0) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage()));
              }
              if (value == 1) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LocationPage()));
              }
              if (value == 2) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => BookingPage()));
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
      appBar: appBar(),
      body: content(),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text('Profile'),
    );
  }
}

class content extends StatefulWidget {
  const content({super.key});

  @override
  State<content> createState() => _contentState();
}

class _contentState extends State<content> {
  double padd = 5;
  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width;
    double hei = MediaQuery.of(context).size.height;
    return Container(
      width: wid,
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: hei / 9, bottom: 20),
            height: 140,
            width: 140,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              shape: BoxShape.circle,
            ),
            child: Stack(
              children: [
                Image.asset('images/surgeon.png'),
                Positioned(
                  bottom: -4,
                  right: -4,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 22,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              'Aziz Frg',
              style: TextStyle(
                fontSize: 22,
                color: Color(0xFF0D0D0D),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ModifyProfile()));
              },
              child: Card(
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.all(padd),
                  child: ListTile(
                    leading: Icon(
                      Icons.person_2_outlined,
                      color: Colors.blue,
                      size: 30,
                    ),
                    title: Text(
                      'Your profile',
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward,
                      color: Colors.blue,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Card(
            color: Colors.white,
            child: Container(
              padding: EdgeInsets.all(padd),
              child: ListTile(
                leading: Icon(
                  Icons.payment,
                  color: Colors.blue,
                  size: 30,
                ),
                title: Text(
                  'Payment Methods',
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
            ),
          ),
          Card(
            color: Colors.white,
            child: Container(
              padding: EdgeInsets.all(padd),
              child: ListTile(
                leading: Icon(
                  Icons.favorite_border,
                  color: Colors.blue,
                  size: 30,
                ),
                title: Text(
                  'Favorite',
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SettingsPage()));
            },
            child: Card(
              color: Colors.white,
              child: Container(
                padding: EdgeInsets.all(padd),
                child: ListTile(
                  leading: Icon(
                    Icons.settings_outlined,
                    color: Colors.blue,
                    size: 30,
                  ),
                  title: Text(
                    'Settings',
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward,
                    color: Colors.blue,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
          Card(
            color: Colors.white,
            child: Container(
              padding: EdgeInsets.all(padd),
              child: ListTile(
                leading: Icon(
                  Icons.help_outline,
                  color: Colors.blue,
                  size: 30,
                ),
                title: Text(
                  'Help Center',
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
            ),
          ),
          Card(
            color: Colors.white,
            child: Container(
              padding: EdgeInsets.all(padd),
              child: ListTile(
                leading: Icon(
                  Icons.lock_outline,
                  color: Colors.blue,
                  size: 30,
                ),
                title: Text(
                  'Privacy Policy',
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
            ),
          ),
          Card(
            color: Colors.white,
            child: Container(
              padding: EdgeInsets.all(padd),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.blue,
                  size: 30,
                ),
                title: Text(
                  'Log out',
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
