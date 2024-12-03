import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/Login/Sinup.dart';
import 'package:my_doctor/Login/Verification.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConLogin(),
    );
  }
}

class ConLogin extends StatefulWidget {
  const ConLogin({super.key});

  @override
  State<ConLogin> createState() => _ConLoginState();
}

class _ConLoginState extends State<ConLogin> {
  TextEditingController cemail = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  bool _isObscured = true;
  double demention = 80;
  int test2 = 0, test3 = 0;

    bool isEmailValid(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(0),
                margin: EdgeInsets.only(top: height / 12, bottom: 20),
                child: Text(
                  // 'Sign In',
                  'My Doctor',
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
                'Hi!welcome back,you ve been missed',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF595959),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Email',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF0D0D0D),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 30),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                style: TextStyle(fontSize: 20, color: Colors.black),
                controller: cemail,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: " example@gmail.com",
                  hintStyle: TextStyle(fontSize: 18, color: Color(0xFF595959)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: Color(0xFF056CF2), width: 0.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black, width: 0.5),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Password',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF0D0D0D),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 3),
              child: TextFormField(
                obscureText: _isObscured,
                onChanged: (value) {
                  setState(() {});
                },
                style: TextStyle(fontSize: 20, color: Colors.black),
                controller: cpassword,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscured == true
                            ? _isObscured = false
                            : _isObscured = true;
                      });
                    },
                    icon: _isObscured == true
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
                    borderSide:
                        BorderSide(color: Color(0xFF056CF2), width: 0.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black, width: 0.5),
                  ),
                ),
              ),
            ),
            Row(
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
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 40, top: 50),
              child: MaterialButton(
                color: Color(0xff0554F2),
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  if (cemail.text == "") {
                    test2 = 0;
                  } else {
                    if (!isEmailValid(cemail.text)) {
                      test2 = 0;
                    } else {
                      test2 = 1;
                      print('adsfsagasdfhafdh');
                    }
                  }
                  if (cpassword.text.length < 3) {
                    test3 = 0;
                  } else {
                    test3 = 1;
                  }
                  if (test2 == 1 && test3 == 1) {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.success,
                      animType: AnimType.rightSlide,
                      title: 'success',
                      desc: 'Information entered successfully',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                            VerificationPage(email: cemail.text)));
                      },
                    )..show();
                  }
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey[400],
                    thickness: 1,
                    endIndent: 10,
                  ),
                ),
                Text(
                  'Or login with',
                  style: TextStyle(color: Color(0xFF595959), fontSize: 18),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey[400],
                    thickness: 1,
                    indent: 10,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: demention,
                    width: demention,
                    child: MaterialButton(
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      child: Container(
                        height: 50,
                        width: 50,
                        child: Image.asset(
                          'images/Google.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: demention,
                    width: demention,
                    child: MaterialButton(
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      child: Container(
                        height: 120,
                        width: 120,
                        child: Image.asset(
                          'images/Facebook.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: demention,
                    width: demention,
                    child: Container(
                      height: 120,
                      width: 120,
                      child: MaterialButton(
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 6),
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        child: Image.asset(
                          'images/Appel.png',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't hava account? ",
                    style: TextStyle(fontSize: 18),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => SinupPage()));
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Color(0xFF0554F2), fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
