import 'dart:async';
import 'package:flutter/material.dart';

class OTPVerification extends StatefulWidget {
  final String phoneNumber;
  
  OTPVerification({required this.phoneNumber});

  @override
  _OTPVerificationState createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  TextEditingController otpController = TextEditingController();
  int countdown = 90; // OTP expiration time in seconds
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (countdown > 0) {
          countdown--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  void resendOTP() {
    setState(() {
      countdown = 90;
    });
    startTimer();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("OTP Sent to ${widget.phoneNumber}")),
    );
  }

  void verifyOTP() {
    String otp = otpController.text;
    if (otp.length == 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("OTP Verified Successfully!")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid OTP! Please try again.")),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png", height: 80),
            SizedBox(height: 20),
            Text("Verify Your Mobile Number", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text("We've Sent Your Verification Code To ${widget.phoneNumber}", textAlign: TextAlign.center, style: TextStyle(color: Colors.orange, fontSize: 14)),
            SizedBox(height: 20),
            Text("Enter Code", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) => otpBox()),
            ),
            SizedBox(height: 20),
            Text("Expires in ${countdown ~/ 60}:${(countdown % 60).toString().padLeft(2, '0')}", style: TextStyle(color: Colors.orange, fontSize: 14)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: verifyOTP,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Text("Verify", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Didn't Receive OTP?", style: TextStyle(color: Colors.orange, fontSize: 14)),
                TextButton(
                  onPressed: countdown == 0 ? resendOTP : null,
                  child: Text("Resend", style: TextStyle(color: Colors.blue, fontSize: 14, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget otpBox() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 2, color: Colors.black))),
      child: Center(
        child: TextField(
          controller: otpController,
          textAlign: TextAlign.center,
          maxLength: 1,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(counterText: "", border: InputBorder.none),
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
