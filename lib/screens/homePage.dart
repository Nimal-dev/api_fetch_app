import 'package:flutter/material.dart';
import 'package:nimal/screens/assignmentPage.dart'; // Import assignment page for navigation

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.brown,
              Color.fromARGB(255, 255, 118, 64)
            ], // Gradient background colors from brown to orange
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter, // Gradient direction from top to bottom
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Card(
              elevation: 10, // Card shadow depth
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15), // Rounded corners for the card
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Make column take minimum required space
                  children: [
                    const Text(
                      "Flutter Developer Assignment", // Title text
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                    const SizedBox(height: 15), // Vertical spacing
                    const Text(
                      "Simple API-Fetching Flutter Application", // Subtitle text
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.black87),
                    ),
                    const SizedBox(height: 10), // Vertical spacing
                    const Text(
                      "Developed by: Nimal Prince", // Developer credit
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black54),
                    ),
                    const SizedBox(height: 20), // Vertical spacing
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown, // Button background color
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10), // Button padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Rounded corners for button
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => AssignmentPage()), // Navigate to the assignment page on clicked
                        );
                      },
                      child: const Text(
                        "Get Started", // Button text
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
