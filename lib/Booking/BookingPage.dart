import 'package:flutter/material.dart';
import 'package:my_doctor/HomePage/Homepage.dart';
import 'package:my_doctor/HomePage/Location/LocationPage.dart';
import 'package:my_doctor/Profile/ProfileSettings.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> with SingleTickerProviderStateMixin {
  int index = 2;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // 3 عناصر في TabBar
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Page'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Upcomming'),
            Tab(text: 'Completed'),
            Tab(text: 'Cancelled'),
          ],
        ),
      ),
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
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "Booking"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // محتوى العنصر الأول
          Center(child: Text('Content for Item 1')),
          // محتوى العنصر الثاني
          Center(child: Text('Content for Item 2')),
          // محتوى العنصر الثالث
          Center(child: Text('Content for Item 3')),
        ],
      ),
    );
  }
}


  AppBar appBar() {
    return AppBar(
      leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
      centerTitle: true,
      title: Text('My Booking'),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
      ],
      backgroundColor: Colors.transparent,

    );
  }


class BodyBook extends StatefulWidget {
  const BodyBook({super.key});

  @override
  State<BodyBook> createState() => _BodyBookState();
}

class _BodyBookState extends State<BodyBook> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
