import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ModifyProfile extends StatelessWidget {
  const ModifyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: body(),
      appBar: appBar(),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text('Your Profile'),
    );
  }
}

class body extends StatefulWidget {
  const body({super.key});

  @override
  State<body> createState() => _bodyState();
}

class _bodyState extends State<body> {
  TextEditingController cname = TextEditingController();
  TextEditingController cphone = TextEditingController();
  TextEditingController cemail = TextEditingController();
  TextEditingController cbday = TextEditingController();
  String? name, email, phone, bday, gender;
  bool controler1 = false,
      controler2 = false,
      controler3 = false,
      controler4 = false;
  String? selectedGender = 'male';
  List<String> items = ['male', 'female'];
  String img = 'images/surgeon.png';

  bool isEmailValid(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

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
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 15, top: 10),
                  child: Text(
                    'change',
                    style: TextStyle(
                      color: Color(0xff0554F2),
                      fontSize: 16,
                    ),
                  ),
                ),
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
              'Email',
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
              controller: cemail,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "example@gmail.com",
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
              'Birth day',
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
                setState(() {
                  print(cbday.text);
                });
              },
              style: TextStyle(fontSize: 16, color: Colors.black),
              controller: cbday,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                _DateInputFormatter()
              ],
              decoration: InputDecoration(
                hintText: 'DD/MM/YYYY',
                hintStyle: TextStyle(color: Colors.grey),
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
                    gender = 'male';
                    img = 'images/surgeon.png';
                  } else {
                    img = 'images/doctor.png';
                    gender = 'female';
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
              onPressed: () {
                if (cname.text.length < 3 || cname.text.length > 25)
                  controler1 = false;
                else
                  controler1 = true;

                if (cphone.text.length < 10 || cphone.text.length > 12)
                  controler2 = false;
                else
                  controler2 = true;

                if (cemail.text == "") {
                  controler3 = false;
                } else {
                  if (!isEmailValid(cemail.text)) {
                    controler3 = false;
                  } else {
                    controler3 = true;
                  }
                }
                if (controler1 == true &&
                    controler2 == true &&
                    controler3 == true) {
                  name = cname.text;
                  phone = cphone.text;
                  email = cemail.text;
                  bday = cbday.text;
                } else
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    animType: AnimType.rightSlide,
                    title: 'Error',
                    desc:
                        'There is an issue in the process of entering the information.',
                    btnCancelOnPress: () {},
                    btnOkOnPress: () {},
                  )..show();
              },
              child: Text(
                'Update Profile',
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

class _DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;

    if (text.length > 10) return oldValue;

    String newText = text;
    if (text.length > 2 && text[2] != '/') {
      newText = text.substring(0, 2) + '/' + text.substring(2);
    }
    if (newText.length > 5 && newText[5] != '/') {
      newText = newText.substring(0, 5) + '/' + newText.substring(5);
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
