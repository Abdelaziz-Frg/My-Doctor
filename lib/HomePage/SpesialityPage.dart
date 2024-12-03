import 'package:flutter/material.dart';

class SpesialityPage extends StatefulWidget {
  String specialityname;
  SpesialityPage({super.key, required this.specialityname});

  @override
  State<SpesialityPage> createState() => _SpesialityPageState();
}

class _SpesialityPageState extends State<SpesialityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(),
    );
  }
  AppBar appBar()
  {
    return AppBar(
        backgroundColor: Colors.transparent,
        title: Text(widget.specialityname),
      );
  }
}
