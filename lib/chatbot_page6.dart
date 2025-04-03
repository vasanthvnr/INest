import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      home: ChatScreen2(),
    );
  }
}

class ChatScreen2 extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen2> {
  TextEditingController _controller = TextEditingController();
  List<Map<String, String>> messages = [];

  Map<String, String> botResponses = {
    "available": "Yes, the room is available. Would you like to book?",
    "visit": "Sure! You can schedule a visit from Monday to Friday.",
    "payment": "We accept credit/debit cards and online transfers.",
    "security deposit": "We require a one-month security deposit, which is also \$500. This will be returned when you move out, provided there are no damages.",
    "booking": "To book the room, visit our listing on the app and click the 'Book Now' button to complete your reservation.",
    "amenities": "Our rooms include free WiFi, a gym, housekeeping, and 24/7 security. Some rooms also have kitchen access.",
    "breakfast": "Breakfast is included in select rooms. If not included, you can add it for an additional \$10 per day.",
    "cancellation": "You can cancel your reservation up to 48 hours before check-in for a full refund. Within 48 hours, a 50% fee applies.",
    "airport pickup": "Yes, we provide airport pickup services for \$30. Share your flight details, and we'll arrange a driver for you.",
    "pets": "We have a pet-friendly policy in select rooms. There's an additional \$50 cleaning fee per stay if you bring a pet.",
    "long-term stay": "We offer discounts for stays longer than 30 days. Let us know your expected stay duration for a special rate.",
    "default": "I'm here to assist! Could you rephrase your question if I didn't understand it?"
  };

  void _sendMessage(String text) {
    if (text.isEmpty) return;

    setState(() {
      messages.add({"sender": "user", "text": text});
      _controller.clear();
    });

    _botReply(text);
  }

  void _botReply(String userMessage) {
    String response = botResponses["default"] ?? "I'm here to assist!";

    botResponses.forEach((key, value) {
      if (userMessage.toLowerCase().contains(key)) {
        response = value;
      }
    });

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        messages.add({"sender": "bot", "text": response});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFFF5991E)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Image.asset('assets/images/logo.png', height: 40), // Your Logo Here
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Image Card Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.asset('assets/images/annanagar.png', fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Ginger Hotel", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF012F6B))),
                        Text("Anna Nagar,Chennai", style: GoogleFonts.poppins(color: Color(0xFFF5991E))),
                        Text("From ₹5500/night", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF012F6B))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Hello, I'm interested in booking a room. Is it still available?", style: GoogleFonts.poppins()),
                            SizedBox(height: 5),
                            Text("1:00 pm", style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                      ),
                      SizedBox(width: 8),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/profile.jpg'),
                        radius: 16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Chat Section
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                bool isUser = msg["sender"] == "user";

                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.grey[300] : Color(0xFF012F6B),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      msg["text"]!,
                      style: GoogleFonts.poppins(
                        color: isUser ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Input Box with Attach Button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // 📎 Attach Button
                IconButton(
                  icon: Icon(Icons.attach_file, color: Color(0xFFF5991E)),
                  onPressed: () {
                    // Handle file selection
                  },
                ),

                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                // 📨 Send Button
                IconButton(
                  icon: Icon(Icons.send, color: Color(0xFFF5991E)),
                  onPressed: () => _sendMessage(_controller.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
