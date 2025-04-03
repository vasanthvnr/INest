import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'filter_screen.dart';
import 'hotel_details_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCity = "All";
  String selectedPrice = "Any"; // New filter for price

  final List<Map<String, String>> cities = [
    {"name": "Chennai", "image": "assets/images/chennai.jpg"},
    {"name": "Tambaram", "image": "assets/images/tambaram.jpg"},
    {"name": "Velachery", "image": "assets/images/velachery.jpg"},
    {"name": "Guindy", "image": "assets/images/guindy.jpg"},
    {"name": "Adyar", "image": "assets/images/adyar.jpg"},
    {"name": "Anna Nagar", "image": "assets/images/anna_nagar.jpg"},
    {"name": "T Nagar", "image": "assets/images/t_nagar.jpg"},
    {"name": "OMR", "image": "assets/images/omr.jpg"},
  ];

  final List<Map<String, String>> properties = [
    {
      "name": "Taj Club House",
      "location": "Chennai",
      "price": "₹5,000/night",
      "image": "assets/images/taj_club.jpg",
      "tag": "Price to Confirm"
    },
    {
      "name": "ITC Grand Chola",
      "location": "Guindy",
      "price": "₹7,500/night",
      "image": "assets/images/itc_grand.jpg",
      "tag": "Price to Confirm"
    },
    {
      "name": "The Leela Palace",
      "location": "Adyar",
      "price": "₹10,000/night",
      "image": "assets/images/leela_palace.jpg",
      "tag": "Price to Confirm"
    },
    {
      "name": "Radisson Blu",
      "location": "OMR",
      "price": "₹6,500/night",
      "image": "assets/images/radisson_blu.jpg",
      "tag": "Price to Confirm"
    },
    {
      "name": "Hyatt Regency",
      "location": "T Nagar",
      "price": "₹6,000/night",
      "image": "assets/images/hyatt_regency.jpg",
      "tag": "Price to Confirm"
    },
    {
      "name": "Green Park Hotel",
      "location": "Anna Nagar",
      "price": "₹4,800/night",
      "image": "assets/images/green_park.jpg",
      "tag": "Price to Confirm"
    },
    {
      "name": "Novotel Chennai OMR",
      "location": "OMR",
      "price": "₹5,500/night",
      "image": "assets/images/novotel.jpg",
      "tag": "Price to Confirm"
    },
  ];

  void openFilterScreen() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FilterScreen()),
    );

    if (result != null) {
      setState(() {
        selectedCity = result["city"] ?? "All";
        selectedPrice = result["price"] ?? "Any";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredProperties = properties.where((p) {
      bool matchesCity = selectedCity == "All" || p["location"] == selectedCity;
      bool matchesPrice = selectedPrice == "Any" || p["price"] == selectedPrice;
      return matchesCity && matchesPrice;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/images/logo.png"), // Logo
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.orange),
            onPressed: openFilterScreen, // Open Filter Screen
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔍 Search Bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search by city, Postcode or university",
                    prefixIcon: Icon(Icons.search, color: Colors.black),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(15),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // 🌆 Popular Cities Section
              Text("Popular Cities across UK",
                  style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cities.length,
                  itemBuilder: (context, index) {
                    bool isSelected = cities[index]["name"] == selectedCity;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCity = cities[index]["name"]!;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 120,
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                cities[index]["image"]!,
                                width: 120,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              cities[index]["name"]!,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: isSelected ? Colors.orange : Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),

              // 🏨 Recommended Properties Section
              Text("Recommended properties across cities",
                  style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),

              filteredProperties.isEmpty
                  ? Center(child: Text("No properties available", style: GoogleFonts.poppins()))
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: filteredProperties.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HotelDetailsScreen(
                                  hotelName: filteredProperties[index]["name"]!,
                                  hotelImage: filteredProperties[index]["image"]!,
                                  hotelPrice: filteredProperties[index]["price"]!,
                                  hotelLocation: filteredProperties[index]["location"]!, hotel: {},
                                ),
                              ),
                            );
                          },
                          child: Card(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                                  child: Image.asset(
                                    filteredProperties[index]["image"]!,
                                    width: double.infinity,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(filteredProperties[index]["name"]!,
                                          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
                                      Text(filteredProperties[index]["price"]!,
                                          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),

      // 📌 Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueAccent,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.support_agent), label: "Support"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Messages"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Wishlist"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
