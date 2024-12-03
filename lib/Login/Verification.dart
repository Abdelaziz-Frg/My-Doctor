import 'package:flutter/material.dart';

class VerificationPage extends StatelessWidget {
  final String email;
  const VerificationPage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: ContVer(
        email: email,
      ),
      appBar: appBar(),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
    );
  }
}

class ContVer extends StatefulWidget {
  final String email;
  const ContVer({super.key, required this.email});

  @override
  State<ContVer> createState() => _ContVerState();
}

class _ContVerState extends State<ContVer> {
  final List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: height / 14),
              child: Text(
                'Verify Code',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5, top: 20),
              child: Text(
                'plese enter the code we just sent to email',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFA6A6A6),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child: Text(
                widget.email,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0554F2),
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) => _buildOTPField(index)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Text(
                "Didn't recive OTP",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xffA6A6A6),
                ),
              ),
            ),
            Container(
              child: Text(
                'Resend code',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationColor: Color(0xff0554F2),
                  decorationThickness: 2,
                  color: Color(0xff0554F2),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 40, top: 50),
              child: MaterialButton(
                color: Color(0xff0554F2),
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: _verifyOTP,
                child: Text(
                  'Verify',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOTPField(int index) {
    return SizedBox(
      width: 60,
      height: 50,
      child: TextFormField(
        controller: _controllers[index],
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24),
        decoration: InputDecoration(
          hintText: "-",
          counterText: "",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 3) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }

  void _verifyOTP() {
    String otp = _controllers.map((controller) => controller.text).join();
    // هنا يمكنك تنفيذ عملية التحقق من OTP
    print("Entered OTP: $otp");
  }
}
