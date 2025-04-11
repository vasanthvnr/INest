import 'package:flutter/material.dart';


Widget payment_mode() {
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.yellow),
        onPressed: () {},
      ),
      title: Text(
        "Select Payment Mode",
        style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    ),
    body: Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Due Now", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text("£480", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 10),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 60,
                          width: 60,
                          color: Colors.grey[300],
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Priya Vairavan", style: TextStyle(fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              CircleAvatar(radius: 10, backgroundColor: Colors.grey),
                              SizedBox(width: 5),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Nina", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                  Text("Uxbridge, London", style: TextStyle(fontSize: 12, color: Colors.grey)),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Text("£480", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  _paymentOption(Icons.credit_card, "Credit Or Debit Card", Colors.black),
                  SizedBox(height: 10),
                  _paymentOption(Icons.payment, "PayPal", Colors.blue),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: _paymentOption(Icons.apple, "Apple Pay", Colors.black)),
                      SizedBox(width: 10),
                      Expanded(child: _paymentOption(Icons.android, "Google Pay", Colors.green)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  leading: Icon(Icons.local_offer, color: Colors.orange),
                  title: Text("Exclusive Cashback Of GBP 50 For Referring A Friend On INest"),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                    child: Text("Apply Offer", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Price Details (1 Item)", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      _priceDetailRow("Total Price", "£480", bold: true),
                      _priceDetailRow("Discount On Price", "0", gray: true),
                      _priceDetailRow("Early Access Fee", "Free", green: true),
                      _priceDetailRow("Platform Fee", "Free", green: true),
                      _priceDetailRow("Service Fee", "Free", green: true),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.blue,
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total Amount: £480", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue,
                  minimumSize: Size(120, 50),
                ),
                onPressed: () {},
                child: Text("Pay Now"),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _paymentOption(IconData icon, String title, Color iconColor) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey, width: 1.5),
      borderRadius: BorderRadius.circular(100),
    ),
    child: Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: ListTile(
          leading: Icon(icon, color: iconColor),
          title: Text(title),
          onTap: () {},
        ),
      ),
    ),
  );
}

Widget _priceDetailRow(String label, String value, {bool bold = false, bool green = false, bool gray = false}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(label, style: TextStyle(color: gray ? Colors.grey : Colors.black)),
      Text(
        value,
        style: TextStyle(
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          color: green ? Colors.green : Colors.black,
        ),
      ),
    ],
  );
}
