import 'package:flutter/material.dart';

class DoctorDetailsPage extends StatelessWidget {
  final String name;
  final String speciality;
  final String city;
  final String country;
  const DoctorDetailsPage(
      {super.key,
      required this.name,
      required this.speciality,
      required this.city,
      required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: BodyDetails(
        name: name,
        speciality: speciality,
        city: city,
        country: country,
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
      centerTitle: true,
      title: Text('Doctor Details'),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.share)),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border,
            )),
      ],
      backgroundColor: Colors.transparent,
    );
  }
}

class BodyDetails extends StatefulWidget {
  final String name;
  final String speciality;
  final String city;
  final String country;
  const BodyDetails(
      {super.key,
      required this.name,
      required this.speciality,
      required this.city,
      required this.country});

  @override
  State<BodyDetails> createState() => _BodyDetailsState();
}

class _BodyDetailsState extends State<BodyDetails> {
  @override
  Widget build(BuildContext context) {
    double dem = MediaQuery.of(context).size.width / 3.6;
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(20),
      child: Container(
        height: height,
        child: Column(
          children: [
            Card(
              color: Colors.white,
              elevation: 0,
              child: Row(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: dem,
                        width: dem,
                        child: ClipOval(
                          child: Image.asset('images/doctor.png'),
                        ),
                      ),
                      Positioned(
                        bottom: 16,
                        right: -5,
                        child: Container(
                          height: dem / 4,
                          width: dem / 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(dem),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 2,
                                right: 2,
                                child: Container(
                                  height: dem / 4 - 10,
                                  width: dem / 4 - 10,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(dem),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Image.asset(
                                'images/seal.png',
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dr ${widget.name}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '${widget.speciality}',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.3),
                            fontSize: 16,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 22),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.blue,
                                size: 26,
                              ),
                              Text(
                                '${widget.city}, ${widget.country}',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.3),
                                  fontSize: 16,
                                ),
                              ),
                              Icon(
                                Icons.map_outlined,
                                color: Colors.blue,
                                size: 26,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Expanded(
                child: Divider(
                  color: Colors.grey[400],
                  thickness: 1,
                  indent: 10,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 3),
                      height: dem / 2,
                      width: dem / 2,
                      decoration: BoxDecoration(
                        color: Color(0x44056CF2),
                        borderRadius: BorderRadius.circular(dem),
                      ),
                      child: Icon(
                        Icons.people,
                        size: 32,
                        color: Colors.blue[600],
                      ),
                    ),
                    Text(
                      '2431+',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                    'Patients',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.3),
                      fontSize: 16,
                    ),)
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: dem / 2,
                      width: dem / 2,
                      decoration: BoxDecoration(
                        color: Color(0x44056CF2),
                        borderRadius: BorderRadius.circular(dem),
                      ),
                      child: Icon(
                        Icons.work_outline,
                        size: 32,
                        color: Colors.blue[600],
                      ),
                    ),
                    Text(
                      '7+',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                    'Exp',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.3),
                      fontSize: 16,
                    ),)
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: dem / 2,
                      width: dem / 2,
                      decoration: BoxDecoration(
                        color: Color(0x44056CF2),
                        borderRadius: BorderRadius.circular(dem),
                      ),
                      child: Icon(
                        Icons.star,
                        size: 32,
                        color: Colors.blue[600],
                      ),
                    ),
                    Text(
                      '4.1',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                    'Rating',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.3),
                      fontSize: 16,
                    ),)
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: dem / 2,
                      width: dem / 2,
                      decoration: BoxDecoration(
                        color: Color(0x44056CF2),
                        borderRadius: BorderRadius.circular(dem),
                      ),
                      child: Icon(
                        Icons.comment,
                        size: 32,
                        color: Colors.blue[600],
                      ),
                    ),
                    Text(
                      '541',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                    'Review',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.3),
                      fontSize: 16,
                    ),)
                  ],
                ),
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 20),
              child: Text(
                   'About',
                   style: TextStyle(
                       color: Colors.black,
                       fontSize: 20,),
              ),
            ),
                TextWithEllipsis(),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 20),
              child: Text(
                   'Working hours',
                   style: TextStyle(
                       color: Colors.black,
                       fontSize: 20,),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Expanded(
                child: Divider(
                  color: Colors.grey[400],
                  thickness: 1,
                  indent: 10,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text(
                      "Saturday",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 16,
                      ),
                    ),
                    Text('00:00-00:00 ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    )
              ],),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text(
                      "Sunday",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 16,
                      ),
                    ),
                    Text('00:00-00:00 ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    )
              ],),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text(
                      "Monday",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 16,
                      ),
                    ),
                    Text('00:00-00:00 ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    )
              ],),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text(
                      "Tuesday",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 16,
                      ),
                    ),
                    Text('00:00-00:00 ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    )
              ],),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text(
                      "Wednesday",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 16,
                      ),
                    ),
                    Text('00:00-00:00 ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    )
              ],),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text(
                      "Thursday",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 16,
                      ),
                    ),
                    Text('00:00-00:00 ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    )
              ],),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Expanded(
                child: Divider(
                  color: Colors.grey[400],
                  thickness: 1,
                  indent: 10,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 40,top: 5),
              child: MaterialButton(
                color: Color(0xff0554F2),
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                },
                child: Text(
                  'Book Appointment',
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

class TextWithEllipsis extends StatelessWidget {
  final String longText = 
      'Modern technology has significantly changed our lives, as we rely on smart devices in many aspects of our daily routines. Whether for work, entertainment, or education, technology helps streamline tasks and save time, allowing us to progress and evolve more quickly.';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Full Text'),
            content: Text(longText),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Close'),
              ),
            ],
          ),
        );
      },
      child: Text(
        longText,
        style: TextStyle(
          color: Colors.black.withOpacity(0.3),
          fontSize: 16,
        ),
        maxLines: 3, 
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
