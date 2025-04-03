import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main_screen2.dart';
import 'Chatbot_page3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF012F6B),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: HomeScreen1(),
    );
  }
}

class HomeScreen1 extends StatelessWidget {
  final Color primaryColor = Color(0xFF012F6B);
  final Color accentColor = Color(0xFFF5991E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: accentColor),
          onPressed: () {
            Navigator.pop(
              context,
            ); // This will take the user to the previous screen
          },
        ),
        title: Container(
          decoration: BoxDecoration(
            border: Border.all(color: primaryColor),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Brunel University",
                      hintStyle: TextStyle(color: primaryColor),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(color: primaryColor),
                  ),
                ),
                Icon(Icons.search, color: primaryColor),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(color: primaryColor),
                    ),
                  ),
                  icon: Icon(Icons.sort, color: accentColor),
                  label: Text("Sort", style: TextStyle(color: primaryColor)),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(
                      context,
                    ); // Navigates back when clicking Filters
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(color: primaryColor),
                    ),
                  ),
                  icon: Icon(Icons.filter_list, color: accentColor),
                  label: Text(
                    "Filters(6)",
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  propertyCard(
                    'Park Hyatt, India',
                    'Guindy, Chennai',
                    'assets/images/guindy_hotel.png',
                    '1.2 Km From Railway Station',
                    '₹8,000/Month',
                  ),
                  propertyCard(
                    'Ginger Hotel, India',
                    'Anna nagar, Chennai',
                    'assets/images/annanagar.png',
                    '3.5 Km From University',
                    '₹12,000/Month',
                  ),
                  propertyCard(
                    'Taj Club, India',
                    'Anna salai, Chennai',
                    'assets/images/taj_club.jpg',
                    '3.5 Km From University',
                    '₹12,000/Month',
                  ),
                  propertyCard(
                    'ITC Grand Chola, India',
                    'Guindy, Chennai',
                    'assets/images/itc_grand.jpg',
                    '3.5 Km From University',
                    '₹12,000/Month',
                  ),
                  propertyCard(
                    'Leela Place, India',
                    'Adyar, Chennai',
                    'assets/images/leela_palace.jpg',
                    '3.5 Km From University',
                    '₹12,000/Month',
                  ),
                  propertyCard(
                    'Green Park Hotel, India',
                    'Vadapalani, Chennai',
                    'assets/images/green_park.jpg',
                    '3.5 Km From University',
                    '₹12,000/Month',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
     bottomNavigationBar: BottomNavigationBar(
  type: BottomNavigationBarType.fixed,
  backgroundColor: Color(0xFF011B5D),
  selectedItemColor: Color(0xFFFAA61A),
  unselectedItemColor: Colors.grey,
  selectedLabelStyle: GoogleFonts.poppins(fontSize: 12),
  unselectedLabelStyle: GoogleFonts.poppins(fontSize: 12),
  onTap: (index) {
    if (index == 2) {  // Index for Messages
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChatScreen()),
      );
    }
  },
  items: [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.support), label: "Support"),
    BottomNavigationBarItem(icon: Icon(Icons.message), label: "Messages"),
    BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Wishlist"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
  ],
),
    );
  }
}

Widget propertyCard(
  String city,
  String location,
  String image,
  String distance,
  String price,
) {
  return Builder(
    builder: (innerContext) => GestureDetector(
      onTap: () {
        Navigator.push(
          innerContext,
          MaterialPageRoute(builder: (context) => HotelListingScreen()),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 3,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    height: 150,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Icon(Icons.favorite_border, color: Color(0xFF012F6B)),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    city,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF012F6B),
                    ),
                  ),
                  Text(
                    location,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Color(0xFFF5991E),
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Color(0xFFF5991E), size: 16),
                      SizedBox(width: 5),
                      Text(
                        distance,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Color(0xFF012F6B),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    price,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFFF5991E),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Color(0xFF012F6B)),
                        ),
                        child: Text(
                          'Free To Contact',
                          style: GoogleFonts.poppins(color: Color(0xFFF5991E)),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Color(0xFF012F6B)),
                        ),
                        child: Text(
                          'Verified By iNest',
                          style: GoogleFonts.poppins(color: Color(0xFFF5991E)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


