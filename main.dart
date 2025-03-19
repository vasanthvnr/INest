import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'language_screen.dart';
import 'onboarding_screen.dart';
import 'welcome_screen.dart';
import 'registration_screen.dart';
import 'otp_verification.dart';
import 'home_screen.dart';
import 'filter_screen.dart'; // Ensure this screen exists

void main() {
  runApp(const ChennaiInestApp());
}

class ChennaiInestApp extends StatelessWidget {
  const ChennaiInestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash', // Start with the Splash Screen
      routes: {
        '/splash': (context) => SplashScreen(),
        '/language': (context) => LanguageScreen(),
        '/onboarding': (context) => OnboardingScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/home': (context) => HomeScreen(),
        '/filter':(context)=> FilterScreen(),
        '/registration': (context) => RegistrationScreen(),
        // Ensure WelcomeScreen exists
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/otp') {
          final args = settings.arguments as Map<String, String>?;
          return MaterialPageRoute(
            builder:
                (context) => OTPVerification(phoneNumber: args?['phone'] ?? ''),
          );
        }
        return null; // Default case
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Image.asset('assets/images/logo.png', height: 120),
                const SizedBox(height: 10),
              ],
            ),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/language');
              },
              child: Text(
                "Continue",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
