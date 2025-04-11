import 'package:chennai_nest/filter_screen.dart';
import 'package:chennai_nest/main_screen7.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      home: HomeScreen2(),
    );
  }
}

class HomeScreen2 extends StatelessWidget {
  final List<String> cities = [
    'Chennai',
    'Coimbatore',
    'Madurai',
    'Trichy',
    'Salem',
  ];
  final List<String> cityImages = [
    'assets/images/adyar.jpg',
    'assets/images/coimbatore.png',
    'assets/images/madurai.png',
    'assets/images/trichy.png',
    'assets/images/salem.png',
  ];
  final List<String> locations = [
    'Adyar',
    'Velachery',
    'OMR',
    'Anna Nagar',
    'Tambaram',
    'T Nagar',
    'Guindy',
    'Perambur',
    'Nungambakkam',
    'Sholinganallur',
  ];

  final Color primaryColor = Color(0xFF012F6B);
  final Color accentColor = Color(0xFFF5991E);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(child: Image.asset('assets/images/logo.png', height: 40)),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: primaryColor),
            onPressed: () {},
          ),
          SizedBox(width: 10),
          IconButton(
            icon: Icon(Icons.filter_list, color: primaryColor),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FilterScreen()),
              );
            },
          ),
          SizedBox(width: 10),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search by city, Postcode or university',
                hintStyle: TextStyle(fontSize: 12),
                prefixIcon: Icon(Icons.search, color: primaryColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: primaryColor),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Popular Cities across Tamil Nadu",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cities.length,
                itemBuilder:
                    (context, index) =>
                        cityCard(cities[index], cityImages[index]),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Recommended properties across cities",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: locations.length,
                itemBuilder: (context, index) => chipButton(locations[index]),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) => propertyCard(context,index),
              ),
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(iconColor: Color(0xFF012F6B)),
                onPressed: () {},

                child: Text("View all properties"),
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
    
Widget cityCard(String city, String imagePath) {
  return Container(
    margin: EdgeInsets.only(right: 10),
    width: 150,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath, height: 70, width: 120, fit: BoxFit.cover),
        SizedBox(height: 5),
        Text(
          city,
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF012F6B),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

Widget chipButton(String name) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4.0),
    child: Chip(
      label: Text(name, style: TextStyle(color: Color(0xFF012F6B))),
      shape: StadiumBorder(side: BorderSide(color: Color(0xFF012F6B))),
      backgroundColor: Colors.white,
    ),
  );
}

final List<String> propertyImages = [
  'assets/images/annanagar.png',
  'assets/images/hyatt_regency.jpg',
  'assets/images/itc_grand.jpg',
  'assets/images/leela_palace.jpg',
  'assets/images/taj_club.jpg',
];

Widget propertyCard(BuildContext context, int index) { 
  
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HotelPage()),
      );
    },
    child: Container(
      width: 300,
      margin: EdgeInsets.only(right: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image.asset(
                    propertyImages[index], // Use different images
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hotels in chennai", 
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF012F6B))),
                  Text("From ₹5500/night", 
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Color(0xFFF5991E))),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(iconColor: Color(0xFFF5991E)),
                      onPressed: () {},
                      child: Text("Free To Contact", 
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Color(0xFFF5991E))),
                    ),
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


