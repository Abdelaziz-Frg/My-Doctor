import 'package:flutter/material.dart';
import 'package:my_doctor/HomePage/Spesiality.dart';

class AllSpesialityPage extends StatelessWidget {
  const AllSpesialityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Content2(),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text("Category"),
    );
  }
}

class Content2 extends StatefulWidget {
  const Content2({super.key});

  @override
  State<Content2> createState() => _Content2State();
}

class _Content2State extends State<Content2> {
  int index = 0;
  List specialite = [
    {"imgUrl": "healthcare (1).png", "sname": "Cardiology"},
    {"imgUrl": "eye-health (1).png", "sname": "Ophthalmology"},
    {"imgUrl": "ear.png", "sname": "ENT"},
    {"imgUrl": "cross.png", "sname": "Dentistry"},
    {"imgUrl": "orthopedics (1).png", "sname": "Orthopedics"},
  ];

  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.all(20),
      height: hei,
      width: wid,
      // child: GridView.builder(
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 4, // تحديد عدد الأعمدة ليكون 4
      //     // mainAxisSpacing: 40, // المسافة بين العناصر عمودياً
      //     // childAspectRatio: 1, // ضبط نسبة العرض إلى الارتفاع
      //   ),
      //   // itemCount: specialite.length,
      //   itemCount: 5,
      //   itemBuilder: (context, index) {
      //     return Container(
      //       margin: EdgeInsets.only(top: 40),
      //       child: Spesiality(
      //         imgUrl: specialite[index]['imgUrl'],
      //         text: specialite[index]['sname'],
      //       ),
      //     );
      //   },
      // ),
      child: GridView(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: wid/8),
      children: [
        Spesiality(
              imgUrl: specialite[index]['imgUrl'],
              text: specialite[index]['sname'],
            ),
            Spesiality(
              imgUrl: specialite[index]['imgUrl'],
              text: specialite[index]['sname'],
            ),
            Spesiality(
              imgUrl: specialite[index]['imgUrl'],
              text: specialite[index]['sname'],
            ),
            Spesiality(
              imgUrl: specialite[index]['imgUrl'],
              text: specialite[index]['sname'],
            ),
            Spesiality(
              imgUrl: specialite[index]['imgUrl'],
              text: specialite[index]['sname'],
            ),
            Spesiality(
              imgUrl: specialite[index]['imgUrl'],
              text: specialite[index]['sname'],
            ),
            Spesiality(
              imgUrl: specialite[index]['imgUrl'],
              text: specialite[index]['sname'],
            ),
            Spesiality(
              imgUrl: specialite[index]['imgUrl'],
              text: specialite[index]['sname'],
            ),
            Spesiality(
              imgUrl: specialite[index]['imgUrl'],
              text: specialite[index]['sname'],
            ),
      ],),
    );
  }
}
