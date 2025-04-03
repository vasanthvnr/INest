import 'package:chennai_nest/Chatbot_page3.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'booking_page8.dart';

void main() {
  runApp(const HotelApp());
}

class HotelApp extends StatelessWidget {
  const HotelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      home: const HotelPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HotelPage extends StatelessWidget {
  const HotelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF012F6B)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ginger Hotel',
              style: TextStyle(
                color: Color(0xFF012F6B),
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
            Text(
              'Price: ₹5500/night',
              style: TextStyle(color: Color(0xFFF5991E), fontSize: 12.0),
            ),
          ],
        ),
        actions: [
          Icon(Icons.favorite_border, color: Color(0xFF012F6B)),
          SizedBox(width: 10),
          Icon(Icons.share, color: Color(0xFF012F6B)),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Image (Placeholder)
            // Main Image (Replace Placeholder)
            Container(
              height: 200,
              width: double.infinity,
              child: Image.network(
                'assets/images/annanagar.png', // Replace with your image URL
                fit: BoxFit.cover, // Adjust fit as needed
              ),
            ),
            const SizedBox(height: 16.0),
            // Horizontal Image List
            SizedBox(
              height: 95,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  // Define a list of image asset paths
                  final List<String> imagePaths = [
                    'assets/images/room1.png', // Replace with your first image path
                    'assets/images/room2.png', // Replace with your second image path
                    'assets/images/room3.png', // Replace with your third image path
                    'assets/images/room4.png', // Replace with your fourth image path
                  ];

                  return Container(
                    width: 95,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Image.asset(
                      imagePaths[index], // Use the image path from the list based on the index
                      fit: BoxFit.cover, // Adjust fit as needed
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildOutlinedButton(
                  "Photos",
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Color(0xFF012F6B)),
                  ),
                ),
                SizedBox(width: 10),
                _buildOutlinedButton(
                  "Videos",
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Color(0xFF012F6B)),
                  ),
                ),
                SizedBox(width: 10),
                _buildOutlinedButton(
                  "Verified by INest",
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Color(0xFF012F6B)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/profile.jpg'),
                    radius: 30,
                  ),
                  SizedBox(width: 10, height: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nina",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF012F6B),
                        ),
                      ),
                      Text(
                        "Live-in Landlord",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF012F6B),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  _buildOutlinedButtonWithIcon("1 Offers", Icons.local_offer),
                  SizedBox(width: 10),
                  _buildOutlinedButton(
                    "Free to Contact",
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Color(0xFF012F6B)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.location_on, color: Color(0xFFF5991E)),
                  SizedBox(width: 5),
                  Text(
                    "Ginger Hotel,Anna Nagar",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF5991E),
                    ),
                  ),
                  Spacer(),
                  _buildOutlinedIcon(Icons.phone),
                  SizedBox(width: 10),
                  _buildOutlinedIcon(Icons.message),
                  SizedBox(width: 10),
                  _buildOutlinedIcon(Icons.map),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF012F6B),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Nina’s Lovely Uxbridge Home (Available From Jan 2024) Offers A Delightful Blend Of Comfort, Convenience, And Community Living.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF012F6B),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "For Starters, You’ll Have Access To A Convenient Laundry Facility, Making Those Weekly Chores A Breeze.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF012F6B),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 OutlinedButton(
  style: OutlinedButton.styleFrom(
    side: BorderSide(color: Color(0xFF012F6B)),
  ),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BookingSummaryPage()), // Navigate to Booking Page
    );
  },
  child: Text("Book Now", style: TextStyle(color: Color(0xFF012F6B))),
),
OutlinedButton(
  style: OutlinedButton.styleFrom(
    side: BorderSide(color: Color(0xFF012F6B)),
  ),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChatScreen()), // Navigate to Chat Page
    );
  },
  child: Text("Enquire Now", style: TextStyle(color: Color(0xFF012F6B))),
),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildOutlinedButton(String text, {required ButtonStyle style}) {
  return OutlinedButton(
    onPressed: () {},

    child: Text(text, style: TextStyle(color: Color(0xFFF5991E))),
  );
}

Widget _buildOutlinedButtonWithIcon(String text, IconData icon) {
  return OutlinedButton.icon(
    onPressed: () {},
    icon: Icon(icon, color: Color(0xFFF5991E)),
    label: Text(text, style: TextStyle(color: Color(0xFFF5991E))),
  );
}

Widget _buildOutlinedIcon(IconData icon) {
  return Container(
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      border: Border.all(color: Color(0xFF012F6B)),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Icon(icon, color: Color(0xFFF5991E)),
  );
}
