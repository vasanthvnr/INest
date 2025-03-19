import 'package:flutter/material.dart';

class HotelDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> hotel;

  HotelDetailsScreen({required this.hotel, required String hotelName, required String hotelImage, required String hotelPrice, required String hotelLocation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hotel["name"]),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(hotel["image"], width: double.infinity, fit: BoxFit.cover),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hotel["name"],
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "From ${hotel["price"]}",
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  ),
                  SizedBox(height: 16),
                  Text(
                    hotel["details"],
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 20),

                  // Amenities Section
                  Text(
                    "What you will get",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Wrap(
                    spacing: 10,
                    children: [
                      _buildAmenity("Laundry"),
                      _buildAmenity("Equipped"),
                      _buildAmenity("Parking"),
                      _buildAmenity("Shared kitchen"),
                      _buildAmenity("Social spaces"),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Offers Section
                  Text(
                    "Offers",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Card(
                    margin: EdgeInsets.only(top: 8),
                    child: ListTile(
                      leading: Icon(Icons.local_offer, color: Colors.blue),
                      title: Text("Exclusive Cashback of GBP 50"),
                      subtitle: Text("For referring a friend on Nest"),
                    ),
                  ),

                  SizedBox(height: 20),

                  // Nearby Amenities
                  Text(
                    "Nearby Amenities",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on, color: Colors.red),
                    title: Text("0.1 km from Brunel University"),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on, color: Colors.red),
                    title: Text("0.2 km from Uxbridge Tube Station"),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on, color: Colors.red),
                    title: Text("0.2 km from Bus Stop"),
                  ),
                ],
              ),
            ),

            // Book & Enquire Buttons
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Book now"),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text("Enquire now"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAmenity(String amenity) {
    return Chip(
      label: Text(amenity),
      backgroundColor: Colors.blue.shade100,
    );
  }
}

