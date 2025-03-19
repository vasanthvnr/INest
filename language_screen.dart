import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'onboarding_screen.dart';

class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String selectedLanguage = "English";

  final List<Map<String, String>> languages = [
    {"name": "English", "flag": "🇬🇧"},
    {"name": "Spanish", "flag": "🇦🇷"},
    {"name": "Japanese", "flag": "🇯🇵"},
    {"name": "German", "flag": "🇩🇪"},
    {"name": "Korean", "flag": "🇰🇷"},
    {"name": "Cantonese", "flag": "🇨🇦"},
    {"name": "Hindi", "flag": "🇮🇳"},
    {"name": "Vietnamese", "flag": "🇻🇳"},
    {"name": "Mexican", "flag": "🇲🇽"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildHeader(),
          _buildTitleSection(),
          _buildLanguageGrid(),
          _buildContinueButton(context),
          _buildSkipButton(),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue[900],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png', // Replace text with logo image
            height: 80,
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildTitleSection() {
    return Column(
      children: [
        SizedBox(height: 20),
        Text(
          "Select Your Language",
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.blue[900],
          ),
        ),
        SizedBox(height: 5),
        Text(
          "You Can Also Change Language In App\nSettings After Signing In",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(fontSize: 14, color: Colors.orange),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildLanguageGrid() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue[900]!, width: 1.5),
            borderRadius: BorderRadius.circular(15),
          ),
          child: GridView.builder(
            padding: EdgeInsets.all(20),
            shrinkWrap: true,
            itemCount: languages.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 15,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedLanguage = languages[index]["name"]!;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: selectedLanguage == languages[index]["name"]
                          ? Colors.orange
                          : Colors.transparent,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        languages[index]["flag"]!,
                        style: TextStyle(fontSize: 40),
                      ),
                      SizedBox(height: 5),
                      Text(
                        languages[index]["name"]!,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
        ),
        onPressed: () {
          print("Selected Language: $selectedLanguage");
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OnboardingScreen()),
          );
        },
        child: Text(
          "Continue",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildSkipButton() {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OnboardingScreen()),
        );
      },
      child: Text(
        "Skip",
        style: GoogleFonts.poppins(
          fontSize: 16,
          color: Colors.blue[900],
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
