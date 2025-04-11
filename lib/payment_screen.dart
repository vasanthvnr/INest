import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.yellow),
          onPressed: () {},
        ),
        title: const Text(
          'Select Payment Mode',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildDueNowSection(),
              const SizedBox(height: 10),
              buildNinaDetails(),
              const SizedBox(height: 20),
              buildCardIcons(),
              const SizedBox(height: 10),
              buildTextField('Card Number*', 'Enter Card Number'),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(child: buildTextField('Expiration Date*', 'MM/YY')),
                  const SizedBox(width: 10),
                  Expanded(child: buildTextField('Security Code (CVV)*', 'CVV', suffixIcon: Icons.credit_card)),
                ],
              ),
              const SizedBox(height: 10),
              buildTextField('Card Holder Name*', 'Enter Card Holder Name'),
              const SizedBox(height: 20),
              buildSecurePaymentInfo(),
              const SizedBox(height: 20),
              buildPayButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDueNowSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          'Due Now',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          '£480',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget buildNinaDetails() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey,
          child: Icon(Icons.person, color: Colors.white),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Nina',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Live-in Landlord',
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              'Uxbridge, London',
              style: TextStyle(color: Colors.blue),
            ),
            Text(
              'Maygoods Lane, London',
              style: TextStyle(color: Colors.orange),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildCardIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(5, (index) => Container(
        width: 40,
        height: 25,
        color: Colors.grey,
      )),
    );
  }

  Widget buildSecurePaymentInfo() {
    return Row(
      children: const [
        Icon(Icons.lock, color: Colors.green),
        SizedBox(width: 5),
        Text(
          'Secure Payment',
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            'Your Card Will Be Saved Securely For Future Payments',
            style: TextStyle(color: Colors.black54),
          ),
        ),
      ],
    );
  }

  Widget buildPayButton(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text(
            'Continue',
            style: TextStyle(fontSize: 16, color: Colors.yellow),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, String hint, {IconData? suffixIcon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 5),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
          ),
        ),
      ],
    );
  }
}
