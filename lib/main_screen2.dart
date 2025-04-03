import 'package:chennai_nest/booking_page8.dart';
import 'package:chennai_nest/property_screen4.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'chatbot_page3.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chennai Hotel Listing',
      theme: ThemeData(
        primaryColor: const Color(0xFF012F6B),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFFF5991E),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),

      debugShowCheckedModeBanner: false,
      home: HotelListingScreen(), // Set your initial screen here
      routes: {
        '/message':
            (context) => ChatScreen(), // Keep your route definition
      },
    );
  }
}

class HotelListingScreen extends StatelessWidget {
  const HotelListingScreen({super.key});

  // Replace with the actual latitude and longitude of the hotel
  final double hotelLatitude =   13.0604;
  final double hotelLongitude = 80.2496;

  Future<void> _openGoogleMap() async {
    final Uri googleMapUrl = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$hotelLatitude,$hotelLongitude',
    );
    if (await canLaunchUrl(googleMapUrl)) {
      await launchUrl(googleMapUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF012F6B)),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen2()),
            );
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
                fontSize: 16.0,
              ),
            ),
            Text(
              'Price: ₹5500/night',
              style: TextStyle(
                color: Color(0xFFF5991E),
                fontSize: 12.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Color(0xFF012F6B)),
            onPressed: () {
              // Handle share button action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Image (Placeholder)
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey[300], // Placeholder color
              child: Image.asset(
                'assets/images/annanagar.png', // Path to your image asset
                fit:
                    BoxFit
                        .cover, // How the image should be fitted within the container
              ),
            ),
            const SizedBox(height: 8.0),
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ginger, Chennai',
                            style: Theme.of(
                              context,
                            ).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF012F6B),
                            ),
                          ),
                          Text(
                            'From ₹5500 / Night',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF012F6B),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              // Handle offers action
                            },
                            icon: const Icon(
                              Icons.local_offer,
                              color: Color(0xFFF5991E),
                            ),
                            label: const Text('Offers'),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Color(0xFFF5991E),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(color: Color(0xFF012F6B)),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          ElevatedButton(
                            onPressed: () {
                              // Handle free to contact action
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Color(0xFFF5991E),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(color: Color(0xFF012F6B)),
                              ),
                            ),
                            child: const Text('Free To Contact'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // User Info (Placeholder)
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 20,
                          ),
                          const SizedBox(width: 8.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Host Name',
                                style: TextStyle(
                                  color: Color(0xFF012F6B),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Live-in Host',
                                style: TextStyle(color: Color(0xFF012F6B)),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.phone,
                              color: Color(0xFFF5991E),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(color: Color(0xFF012F6B)),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.message,
                              color: Color(0xFFF5991E),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(color: Color(0xFF012F6B)),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: _openGoogleMap,
                            icon: const Icon(
                              Icons.location_on,
                              color: Color(0xFFF5991E),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(color: Color(0xFF012F6B)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF012F6B),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'This is the first paragraph of the description for the hotel listing in Chennai. You can add more details about the property, its amenities, and the surrounding area to attract potential guests.',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF012F6B),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'This is the second paragraph of the description. You might want to highlight key features, nearby attractions, or transportation options. Providing comprehensive information can improve user engagement.',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF012F6B),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'Details',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF012F6B),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  // Details Section (Placeholder)
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: [
                      _buildDetailChip(context, 'Type', 'Hotel'),
                      _buildDetailChip(context, 'Room Type', 'Private Room'),
                      _buildDetailChip(context, 'Security Deposit', '₹XXX'),
                      _buildDetailChip(context, 'Attached Bathroom', 'Yes'),
                      _buildDetailChip(context, 'Balcony', 'No'),
                      _buildDetailChip(
                        context,
                        'Preferred Tenants',
                        'Families',
                      ),
                      _buildDetailChip(context, 'Number Of Tenants', '2'),
                      _buildDetailChip(context, 'Updated', '26th March 2025'),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'What you will get',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  // Amenities Section
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: [
                      _buildAmenityChip(context, 'Laundry'),
                      _buildAmenityChip(context, 'Courtyard'),
                      _buildAmenityChip(context, 'Parking'),
                      _buildAmenityChip(context, 'Shared Kitchen'),
                      _buildAmenityChip(context, 'Social Spaces'),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'Bills Included',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  // Bills Included Section
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: [
                      _buildBillChip(
                        context,
                        'Wi-Fi (Average Speed Of 110mb/s)',
                      ),
                      _buildBillChip(context, 'Electric'),
                      _buildBillChip(context, 'Heating'),
                      _buildBillChip(context, 'Gas'),
                      _buildBillChip(context, 'Water'),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'Offers',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  // Offers Section
                  Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Exclusive Cashback Of GBP 50',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF012F6B),
                                ),
                              ),
                              const Text(
                                'For Referring A Friend On INest',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF012F6B),
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Handle view offer action
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Color(0xFFF5991E),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(color: Color(0xFF012F6B)),
                              ),
                            ),
                            child: const Text('View'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    'Posted On: 26th December 2023',
                    style: TextStyle(color: Color(0xFF012F6B), fontSize: 12.0),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'Nearby Amenities',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF012F6B),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  // Map (Placeholder)
                  GestureDetector(
                    onTap: _openGoogleMap,
                    child: Container(
                      height: 150,
                      color: Colors.grey[300],
                      child: const Center(
                        child: (Image(
                          image: AssetImage('assets/images/map.png'),
                        )),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  // Nearby Locations in a Border with 2 Columns
                  // ... other widgets in your HotelListingScreen build method ...

                  // Nearby Locations in a Border with 2 Columns
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFF5991E)),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4.0,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: Color(0xFF012F6B),
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text(
                                      '1.3 Km From Bus Stand',
                                      style: TextStyle(
                                        color: Color(0xFF012F6B),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4.0,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: Color(0xFF012F6B),
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text(
                                      '0.7 Km From High Street',
                                      style: TextStyle(
                                        color: Color(0xFF012F6B),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4.0,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: Color(0xFF012F6B),
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text(
                                      '0.2 Km From Tasco',
                                      style: TextStyle(
                                        color: Color(0xFF012F6B),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4.0,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: Color(0xFF012F6B),
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text(
                                      '0.4 Km From Restaurants',
                                      style: TextStyle(
                                        color: Color(0xFF012F6B),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4.0,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: Color(0xFF012F6B),
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text(
                                      '0.2 Km From Bus Stop',
                                      style: TextStyle(
                                        color: Color(0xFF012F6B),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4.0,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: Color(0xFF012F6B),
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text(
                                      '0.4 Km From Gym',
                                      style: TextStyle(
                                        color: Color(0xFF012F6B),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // ... the rest of your build method ...
                  const SizedBox(height: 16.0),
                  Text(
                    'Recommendations',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF012F6B),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  // Recommendation Item 1 (Adjusted Layout)
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 100,
                            color: Colors.grey[300], // Placeholder for image
                            child: const Center(
                              child: (Image(
                                image: AssetImage(
                                  'assets/images/annanagar.png',
                                ),
                              )),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Ginger Hotel, Anna Nagar',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF012F6B),
                                      ),
                                    ),
                                    const Text(
                                      '178 Lang Ln, Chennai',
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xFFF5991E),
                                      ),
                                    ),
                                    const Text(
                                      'From £5500/night',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF012F6B),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // Handle free to contact action
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Color(0xFFF5991E),
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: BorderSide(
                                      color: Color((0xFF012F6B)),
                                    ),
                                  ),
                                ),
                                child: const Text('Free To Contact'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  // Bottom Buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BookingSummaryPage()
                                )
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Theme.of(context).primaryColor,
                              elevation: 5,
                              shadowColor: Colors.black26,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: const Text('Book now'),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Theme.of(context).primaryColor,
                              elevation: 5,
                              shadowColor: Colors.black26,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: const Text('Enquire now'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailChip(BuildContext context, String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF012F6B)),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$label: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF012F6B),
            ),
          ),
          Text(value, style: TextStyle(color: Color(0xFFF5991E))),
        ],
      ),
    );
  }

  Widget _buildAmenityChip(BuildContext context, String amenity) {
    return Chip(
      label: Text(amenity, style: TextStyle(color: Color(0xFF012F6B))),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: BorderSide(color: Color(0xFF012F6B)),
      ),
      avatar: const Icon(Icons.check_circle_outline, color: Color(0xFFF5991E)),
    );
  }

  Widget _buildBillChip(BuildContext context, String bill) {
    return Chip(
      label: Text(bill, style: TextStyle(color: Color(0xFF012F6B))),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: BorderSide(color: Color(0xFF012F6B)),
      ),
      avatar: const Icon(Icons.receipt, color: Color(0xFFF5991E)),
    );
  }
}
