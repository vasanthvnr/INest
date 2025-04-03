import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main_screen1.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String? selectedMonth;
  double _priceRange = 1000; // Max price by default
  List<String> propertyTypes = [
    "Hostels For Rent",
    "Houses For Rent",
    "Apartments",
    "Find Roommates",
    "Short Term (Monthly)",
  ];
  List<String> roomTypes = ["Private Room", "Shared Room", "Entire Place"];
  List<String> sharingOptions = ["Private Washroom", "Private Kitchen"];
  bool excludeSoldOut = false;

  String? selectedPropertyType;
  String? selectedRoomType;
  List<String> selectedSharing = [];

  void clearAllFilters() {
    setState(() {
      selectedMonth = null;
      _priceRange = 1000;
      selectedPropertyType = null;
      selectedRoomType = null;
      selectedSharing.clear();
      excludeSoldOut = false;
    });
  }

  Widget buildSelectableButton(String text, String type, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (type == "property") {
            selectedPropertyType = text;
          } else if (type == "room") {
            selectedRoomType = text;
          } else if (type == "sharing") {
            if (selectedSharing.contains(text)) {
              selectedSharing.remove(text);
            } else {
              selectedSharing.add(text);
            }
          }
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange : Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Filters",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Move-in Month
              Text(
                "Move in month",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Open month selection
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today, color: Colors.orange),
                      SizedBox(width: 10),
                      Text(
                        selectedMonth ?? "Select move in month",
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Price Range
              Text(
                "Price range (per week)",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Slider(
                value: _priceRange,
                min: 0,
                max: 1000,
                divisions: 10,
                activeColor: Colors.orange,
                label: "£${_priceRange.toInt()}",
                onChanged: (value) {
                  setState(() {
                    _priceRange = value;
                  });
                },
              ),
              Text(
                "£0 - £${_priceRange.toInt()}",
                style: GoogleFonts.poppins(fontSize: 16),
              ),
              SizedBox(height: 20),

              // Property Type
              Text(
                "Property Type",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 10,
                children:
                    propertyTypes.map((type) {
                      return buildSelectableButton(
                        type,
                        "property",
                        selectedPropertyType == type,
                      );
                    }).toList(),
              ),
              SizedBox(height: 20),

              // Room Type
              Text(
                "Room type",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 10,
                children:
                    roomTypes.map((type) {
                      return buildSelectableButton(
                        type,
                        "room",
                        selectedRoomType == type,
                      );
                    }).toList(),
              ),
              SizedBox(height: 20),

              // Sharing Options
              Text(
                "Sharing",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 10,
                children:
                    sharingOptions.map((option) {
                      return buildSelectableButton(
                        option,
                        "sharing",
                        selectedSharing.contains(option),
                      );
                    }).toList(),
              ),
              SizedBox(height: 20),

              // Availability
              Text(
                "Availability",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    excludeSoldOut = !excludeSoldOut;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    color: excludeSoldOut ? Colors.orange : Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Exclude Sold-Out",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: excludeSoldOut ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Buttons: Clear All & Apply
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: clearAllFilters,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 24,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "Clear all",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  HomeScreen1(), // Or MainScreen1() if that's what you intended
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 24,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "Apply", // Or whatever text you want on the button
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20), // Extra space for better scrolling
            ],
          ),
        ),
      ),
    );
  }
}
