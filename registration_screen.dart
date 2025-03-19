import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'otp_verification.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RegistrationScreen(),
  ));
}

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _registerUser() {
    String phone = phoneController.text;
    if (phone.isNotEmpty) {
      // Navigate to OTP Verification
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OTPVerification(phoneNumber: phone)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Enter a valid phone number")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', height: 80),
            SizedBox(height: 20),
            Text("Registration", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text("Sign up your account", style: TextStyle(color: Colors.orange)),
            SizedBox(height: 20),
            TextField(controller: nameController, decoration: InputDecoration(labelText: "Name")),
            TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: phoneController, decoration: InputDecoration(labelText: "Phone")),
            TextField(controller: passwordController, obscureText: true, decoration: InputDecoration(labelText: "Password")),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _registerUser, child: Text("Sign Up")),
            SizedBox(height: 10),
            Text("Or Sign Up Using"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(icon: FaIcon(FontAwesomeIcons.google), onPressed: () {}),
                IconButton(icon: FaIcon(FontAwesomeIcons.facebook), onPressed: () {}),
                IconButton(icon: FaIcon(FontAwesomeIcons.instagram), onPressed: () {}),
                IconButton(icon: FaIcon(FontAwesomeIcons.linkedin), onPressed: () {}),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: Text("Already Have An Account? Login"),
            ),
          ],
        ),
      ),
    );
  }
}
