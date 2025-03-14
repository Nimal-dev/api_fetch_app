import 'dart:convert'; // For JSON parsing
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // HTTP package for API requests

class AssignmentPage extends StatefulWidget {
  AssignmentPage({super.key});

  @override
  State<AssignmentPage> createState() => _AssignmentPageState();
}

class _AssignmentPageState extends State<AssignmentPage> {
  List users = []; // Store fetched data from API
  String? errorMessage; // Store error message if API call fails

  @override
  void initState() {
    super.initState();
    fetchApi(); // Call API when page initializes
  }

  // Function for fetching API details with error handling
  void fetchApi() async {
    setState(() {
      errorMessage = null; // Reset error message when fetching starts
    });
    try {
      print("API Fetching Started");
      const url = "https://jsonplaceholder.typicode.com/post"; // Corrected API URL
      final uri = Uri.parse(url); // Parsing string URL to Uri object
      final response = await http.get(uri); // Makes GET request to API

      if (response.statusCode == 200) {
        // Check if request was successful
        final List jsonData = jsonDecode(response.body); // Parse JSON response
        setState(() {
          users = jsonData; // Update state with fetched data
        });
        print('Data Fetched Successfully');
      } else {
        // Detailed error messages based on the status code
        String message;
        if (response.statusCode == 400) {
          message = "Bad Request : ${response.statusCode} - The server could not understand your request.";
        } else if (response.statusCode == 404) {
          message = "Error ${response.statusCode} - The requested resource could not be found.";
        } else if (response.statusCode == 500) {
          message = "Internal Server Error : ${response.statusCode} - Please try again later.";
        } else {
          message = "Failed to load data. Error code: ${response.statusCode}";
        }

        setState(() {
          errorMessage = message; // Stores error with detailed message
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = "An error occurred while fetching data. Please check your internet connection."; // Handle network and other errors
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.brown, // App bar color matching theme
        title: const Text(
          'Assignment Page',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown,
        child: const Icon(Icons.replay_outlined, color: Colors.white), // Refresh button icon
        onPressed: fetchApi, // Call API again when button is pressed
      ),
      body: errorMessage != null
          ? Center(
              // Error UI when API call fails
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error, color: Colors.red, size: 50), // Error icon
                    const SizedBox(height: 10),
                    Text(
                      errorMessage!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16, color: Colors.red),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: fetchApi, // Retry API call
                      child: const Text("Retry"),
                    ),
                  ],
                ),
              ),
            )
          : users.isEmpty
              ? const Center(child: CircularProgressIndicator()) // Loading indicator while fetching data
              : ListView.builder(
                  // Display data in a scrollable list using Listview
                  padding: const EdgeInsets.all(10),
                  itemCount: users.length, // Number of items to display
                  itemBuilder: (context, index) {
                    final user = users[index]; // Get current item data
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Rounded corners for cards
                      ),
                      elevation: 5, // Card shadow
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "User ID: ${user['userId']}  |  ID: ${user['id']}", // Display user and post IDs
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.brown,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              user['title'], // Display post title
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              textAlign: TextAlign.justify,
                              user['body'], // Display post body content
                              style: const TextStyle(fontSize: 14, color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
