
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chatbot_page6.dart';
import 'main_screen2.dart';
import 'filter_screen.dart';



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
      home: ChatScreen4(),
    );
  }
}

class ChatScreen4 extends StatefulWidget {
  @override
  _ChatScreen4State createState() => _ChatScreen4State();
}

class _ChatScreen4State extends State<ChatScreen4> {
  int _selectedIndex = 2; // Set "Messages" as the initially selected tab

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index

      // Navigation based on selected tab
      if (index == 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HotelListingScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFFF5991E)),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HotelListingScreen()),
            );
          },
        ),
        title: Image.asset('assets/images/logo.png', height: 40),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FilterScreen()),
                    );
                  },
                  icon: Icon(Icons.sort, color: Color(0xFFF5991E)),
                  label: Row(
                    children: [
                      Text("Sort", style: GoogleFonts.poppins(color: Color(0xFF012F6B))),
                      Icon(Icons.arrow_drop_down, color: Color(0xFFF5991E)),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Color(0xFF012F6B)),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FilterScreen()),
                    );
                  },
                  icon: Icon(Icons.filter_list, color: Color(0xFFF5991E)),
                  label: Text("Filters", style: GoogleFonts.poppins(color: Color(0xFF012F6B))),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Color(0xFF012F6B)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: GoogleFonts.poppins(),
                prefixIcon: Icon(Icons.search, color: Color(0xFF012F6B)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Color(0xFF012F6B)),
                ),
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatScreen2()),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/profile.jpg'),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Nina", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                                    Text("Live-In Landlord", style: GoogleFonts.poppins(color: Colors.grey)),
                                  ],
                                ),
                                Text("Today", style: GoogleFonts.poppins(color: Color(0xFFF5991E))),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text("Ginger Hotel", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                            Text("Anna Nagar,Chennai ", style: GoogleFonts.poppins(color: Color(0xFFF5991E))),
                            SizedBox(height: 4),
                            Text("You're in Your House. Is It Still Available?", style: GoogleFonts.poppins()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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

