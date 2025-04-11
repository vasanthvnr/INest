import 'package:chennai_nest/main_screen7.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BookingSummaryPage1(),
    );
  }
}

class BookingSummaryPage1 extends StatefulWidget {
  @override
  _BookingSummaryPage1State createState() => _BookingSummaryPage1State();
}

class _BookingSummaryPage1State extends State<BookingSummaryPage1> {
  final Color primaryColor = Color(0xFF012F6B);
  final Color accentColor = Color(0xFFF5991E);
  final Color textFieldFillColor = Color(0xFFEFEFEF);
   bool isMyself = true;
  bool isChecked = true;

  bool _isMyself = false; // Initialize to false for "Someone Else" selected

  @override
  void initState() {
    super.initState();
    _isMyself = false; // Initialize to false for "Someone Else" selected
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton( // Changed to IconButton
          icon: Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () {
            // Navigate to the "home page" when the back arrow is clicked
            // For demonstration, let's navigate to a simple page. 
            // You'll need to replace this with your actual home page navigation.
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HotelPage()), // Replace MyHomePage() with your actual home page widget
            );
          },
        ),
        title: Text("Booking Summary", style: GoogleFonts.poppins(color: primaryColor)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/profile.jpg"),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Nina", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor)),
                        Text("Live-in Landlord", style: GoogleFonts.poppins(color: primaryColor)),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset("assets/images/room1.png", width: 150, height: 100, fit: BoxFit.cover),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text("Ginger Hotel", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: primaryColor)),
              Text("Anna Nagar, Chennai", style: GoogleFonts.poppins(color: accentColor)),
              const SizedBox(height: 10),
              Text("Nina’s Lovely Home available from Jan 2024. A blend of comfort and convenience.", style: GoogleFonts.poppins(color: primaryColor)),
              const SizedBox(height: 20),
              _buildSectionTitle("Property Details"),
              _buildPropertyDetails(),
              _buildSectionTitle("Property Rules"),
              Text("• You will not be allowed to edit your name post-booking.", style: GoogleFonts.poppins(color: primaryColor)),
              Text("View all", style: GoogleFonts.poppins(color: accentColor)),
              const SizedBox(height: 20),
              _buildSectionTitle("I Am Booking For"),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      value: true,
                      groupValue: _isMyself,
                      title: Text("Myself", style: GoogleFonts.poppins(color: primaryColor)),
                      onChanged: (value) {
                        if (value == true) {
                          Navigator.of(context).pop(); // Go to previous page
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      value: false,
                      groupValue: _isMyself,
                      title: Text("Someone Else", style: GoogleFonts.poppins(color: primaryColor)),
                      onChanged: (value) {
                        if (value == false) {
                          setState(() {
                            _isMyself = false;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(child: _buildTextField("Title", "Ms.")),
                  const SizedBox(width: 8),
                  Expanded(child: _buildTextField("First Name", "Priya")),
                  const SizedBox(width: 8),
                  Expanded(child: _buildTextField("Last Name", "Vairavan")),
                ],
              ),
              const SizedBox(height: 8),
              _buildTextField("Email ID", "ShanmugaPriyavairavan@gmail.com"),
              const SizedBox(height: 8),
              _buildTextField("Phone Number", "07776126271"),
              const SizedBox(height: 8),
              Row(
                children: [
                 Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Expanded(child: Text("By proceeding, I agree to the User Agreement, Terms of Service, and Policies.", style: GoogleFonts.poppins())),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    backgroundColor: accentColor,
                  ),
                  onPressed: () {},
                  child: Text("Confirm Booking", style: GoogleFonts.poppins(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, String value) {
    return TextField(
      controller: TextEditingController(text: value),
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: textFieldFillColor,
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(title, style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: primaryColor)),
    );
  }

  Widget _buildPropertyDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailRow("Type", "House"),
        _buildDetailRow("Room Type", "Private Room"),
        _buildDetailRow("Security Deposit", "500"),
        _buildDetailRow("Attached Bathroom", "Yes"),
        _buildDetailRow("Preferred Tenants", "Students"),
        _buildDetailRow("Number Of Tenants", "1"),
        _buildDetailRow("Availability", "January 2024"),
      ],
    );
  }

  Widget _buildDetailRow(String key, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(child: Text("$key:", style: GoogleFonts.poppins(color: primaryColor))),
          Text(value, style: GoogleFonts.poppins(fontWeight: FontWeight.normal, color: accentColor)),
        ],
      ),
    );
  }
}


