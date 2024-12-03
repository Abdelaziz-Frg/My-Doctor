import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class PasswordManagerPage extends StatelessWidget {
  const PasswordManagerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
      appBar: appBar(),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text('Settings'),
    );
  }
}

class body extends StatefulWidget {
  const body({super.key});

  @override
  State<body> createState() => _bodyState();
}

class _bodyState extends State<body> {
  TextEditingController coldpassword = TextEditingController();
  TextEditingController cnewpassword = TextEditingController();
  TextEditingController cnewpassword2 = TextEditingController();
  bool _isObscured1 = true;
  bool _isObscured2 = true;
  bool _isObscured3 = true;
  bool controler1 = false, controler2 = false, controler3 = false;
  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'current password',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF0D0D0D),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 3),
              child: TextFormField(
                obscureText: _isObscured1,
                onChanged: (value) {
                  setState(() {});
                },
                style: TextStyle(fontSize: 16, color: Colors.black),
                controller: coldpassword,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscured1 == true
                            ? _isObscured1 = false
                            : _isObscured1 = true;
                      });
                    },
                    icon: _isObscured1 == true
                        ? Icon(
                            Icons.visibility_off,
                            color: Color(0xff595959),
                            size: 30,
                          )
                        : Icon(
                            Icons.visibility,
                            size: 30,
                            color: Color(0xff595959),
                          ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Forgot Password?',
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
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'New Password',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF0D0D0D),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 3),
              child: TextFormField(
                obscureText: _isObscured2,
                onChanged: (value) {
                  setState(() {});
                },
                style: TextStyle(fontSize: 16, color: Colors.black),
                controller: cnewpassword,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscured2 == true
                            ? _isObscured2 = false
                            : _isObscured2 = true;
                      });
                    },
                    icon: _isObscured2 == true
                        ? Icon(
                            Icons.visibility_off,
                            color: Color(0xff595959),
                            size: 30,
                          )
                        : Icon(
                            Icons.visibility,
                            size: 30,
                            color: Color(0xff595959),
                          ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
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
              margin: EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Confirm New Password',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF0D0D0D),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 3),
              child: TextFormField(
                obscureText: _isObscured3,
                onChanged: (value) {
                  setState(() {});
                },
                style: TextStyle(fontSize: 20, color: Colors.black),
                controller: cnewpassword2,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscured3 == true
                            ? _isObscured3 = false
                            : _isObscured3 = true;
                      });
                    },
                    icon: _isObscured3 == true
                        ? Icon(
                            Icons.visibility_off,
                            color: Color(0xff595959),
                            size: 30,
                          )
                        : Icon(
                            Icons.visibility,
                            size: 30,
                            color: Color(0xff595959),
                          ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
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
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 40, top: hei - (hei / 1.6)),
              child: MaterialButton(
                color: Color(0xff0554F2),
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  if (cnewpassword.text.length < 8 ||
                      cnewpassword.text.length > 50) {
                    controler2 = false;
                  } else
                    controler2 = true;
                  if (cnewpassword.text != cnewpassword2.text) {
                    controler3 = false;
                  } else
                    controler3 = true;
                  if(controler2 ==true && controler3 == true)
                  {
                  AwesomeDialog(
                  context: context,
                  dialogType: DialogType.infoReverse,
                  animType: AnimType.rightSlide,
                  title: 'Success',
                  desc: 'Password has been successfully changed.',
                  btnCancelOnPress: () {},
                  btnOkOnPress: () {},
                  )..show();
                 }
                 else{
                  AwesomeDialog(
                  context: context,
                  dialogType: DialogType.error,
                  animType: AnimType.rightSlide,
                  title: 'Error',
                  desc: 'There is an issue in the process of entering the password please try again.',
                  btnCancelOnPress: () {},
                  btnOkOnPress: () {},
                  )..show();
                 }
                  },
                child: Text(
                  'Change Password',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
