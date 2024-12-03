import 'package:flutter/material.dart';
import 'package:my_doctor/Profile/PasswordManagerPage.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

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
  @override
  Widget build(BuildContext context) {
    double padd = 5;
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Card(
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
                  'Notification Settings',
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
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: 
              (context)=> PasswordManagerPage()));
            },
            child: Card(
              color: Colors.white,
              child: Container(
                padding: EdgeInsets.all(padd),
                child: ListTile(
                  leading: Icon(
                    Icons.key,
                    color: Colors.blue,
                    size: 30,
                  ),
                  title: Text(
                    'Password Manager',
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
                  Icons.delete_forever_outlined,
                  color: Colors.blue,
                  size: 30,
                ),
                title: Text(
                  'Delet Accout',
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
