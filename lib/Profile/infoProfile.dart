import 'package:flutter/material.dart';

class InfoprofilePage extends StatelessWidget {
  const InfoprofilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Body(),
      appBar: appBar(),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController cname = TextEditingController();
  TextEditingController cphone = TextEditingController();
  TextEditingController cgender = TextEditingController();
  String? selectedGender = 'male';
  List<String> items = ['male', 'female'];
  String img = 'images/surgeon.png';
  // String img = 'doctor.png';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: height / 14, bottom: 20),
              child: Text(
                // 'Sign In',
                'Complite your profile',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 60),
            child: Text(
              "Don't worry, only you can see your personal\ndata.No one else will be able to see it.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF595959),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 40),
            height: 140,
            width: 140,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              shape: BoxShape.circle,
            ),
            child: Stack(
              children: [
                Image.asset(img),
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
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Name',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF0D0D0D),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 20),
            child: TextFormField(
              onChanged: (value) {
                setState(() {});
              },
              style: TextStyle(fontSize: 16, color: Colors.black),
              controller: cname,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xFFf6f6f6), width: 0.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black, width: 0.5),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Phone Number',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF0D0D0D),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 20),
            child: TextFormField(
              onChanged: (value) {
                setState(() {});
              },
              style: TextStyle(fontSize: 16, color: Colors.black),
              controller: cphone,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xFFf6f6f6), width: 0.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black, width: 0.5),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Gender',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF0D0D0D),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(width: 1, color: Colors.black),
              ),
              width: double.infinity,
              child: DropdownButton<String>(
                isExpanded: true,
                value: selectedGender,
                items: items
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            " " + item,
                            style: TextStyle(fontSize: 16),
                          ),
                        ))
                    .toList(),
                onChanged: (val) {
                  if (val == 'male') {
                    img = 'images/surgeon.png';
                  } else {
                    img = 'images/doctor.png';
                  }
                  setState(() {
                    selectedGender = val;
                  });
                },
              )),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 30, top: 40),
            child: MaterialButton(
              color: Color(0xff0554F2),
              padding: EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {},
              child: Text(
                'Complete Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
