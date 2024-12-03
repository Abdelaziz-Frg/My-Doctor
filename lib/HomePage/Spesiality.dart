import 'package:flutter/material.dart';
import 'package:my_doctor/HomePage/SpesialityPage.dart';

class Spesiality extends StatefulWidget {
  String imgUrl;
  String text;
  Spesiality({super.key, required this.imgUrl, required this.text});

  @override
  State<Spesiality> createState() => _SpesialityState();
}

class _SpesialityState extends State<Spesiality> {
  double dem = 85;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: 
          (context)=> SpesialityPage(specialityname: widget.text,)));
        },
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: dem,
              width: dem,
              decoration: BoxDecoration(
                color: Color(0x66056CF2),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Image.asset(
                'images/${widget.imgUrl}',
                fit: BoxFit.contain,
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  widget.text.length > 8
                      ? '${widget.text.substring(0, 8)}...'
                      : widget.text,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}
