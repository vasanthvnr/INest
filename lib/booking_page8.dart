import 'package:chennai_nest/booking_page9.dart';
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
      home: BookingSummaryPage(),
    );
  }
}

class BookingSummaryPage extends StatefulWidget {
  @override
  _BookingSummaryPageState createState() => _BookingSummaryPageState();
}

class _BookingSummaryPageState extends State<BookingSummaryPage> {
  final Color primaryColor = Color(0xFF012F6B);
  final Color accentColor = Color(0xFFF5991E);

  bool isMyself = true;
  bool isChecked = true; // Set checkbox checked by default

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () => Navigator.pop(context), // Navigate back
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
              Text("Anna Nagar,Chennai", style: GoogleFonts.poppins(color: accentColor)),
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
                    child: RadioListTile<bool>(
                      value: true,
                      groupValue: isMyself,
                      title: Text("Myself", style: GoogleFonts.poppins(color: primaryColor)),
                      onChanged: (value) {
                        setState(() {
                          isMyself = true;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<bool>(
                      value: false,
                      groupValue: isMyself,
                      title: Text("Someone Else", style: GoogleFonts.poppins(color: primaryColor)),
                      onChanged: (value) {
                        setState(() {
                          isMyself = false;
                        });
                        Navigator.push(context, MaterialPageRoute(builder: (context) => BookingSummaryPage1()));
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(child: _buildTextField("Title")),
                  const SizedBox(width: 8),
                  Expanded(child: _buildTextField("First Name")),
                  const SizedBox(width: 8),
                  Expanded(child: _buildTextField("Last Name")),
                ],
              ),
              const SizedBox(height: 8),
              _buildTextField("Email ID"),
              const SizedBox(height: 8),
              _buildTextField("Phone Number"),
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
                  Expanded(
                    child: Text("By proceeding, I agree to the User Agreement, Terms of Service, and Policies.", style: GoogleFonts.poppins()),
                  ),
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

  Widget _buildTextField(String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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




