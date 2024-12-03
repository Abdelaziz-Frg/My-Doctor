import 'dart:math';

import 'package:flutter/material.dart';

class Hospital extends StatelessWidget {
  String imgUrl;
  String time;
  double distense;
  Hospital(
      {super.key,
      required this.imgUrl,
      required this.time,
      required this.distense});

  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width;
    double hei = MediaQuery.of(context).size.height;
    return Container(
            margin: EdgeInsets.only(right: 10),
            child: Card(
              color: Colors.white,
              elevation: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    height: hei / 7,
                    width: wid - (wid / 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.only(
                            topEnd: Radius.circular(20),
                            topStart: Radius.circular(20))),
                    child: ClipRRect(
                      borderRadius: BorderRadiusDirectional.only(
                        topEnd: Radius.circular(20),
                        topStart: Radius.circular(20),
                      ).resolve(TextDirection.ltr),
                      child: Image.asset(
                        imgUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    ' ElevateDental',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 2 ,left: 3),
                    child: Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 20,
                          color: Colors.blue,
                        ),
                        Text(' $time min ${distense.toStringAsFixed(1)} km'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
