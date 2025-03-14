import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AssignmentPage extends StatefulWidget {
  AssignmentPage({super.key});

  @override
  State<AssignmentPage> createState() => _AssignmentPageState();
}

class _AssignmentPageState extends State<AssignmentPage> {
  List users = [];
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchApi();
  }

  // Function for fetching API details with error handling
  void fetchApi() async {
    setState(() {
      errorMessage = null;
    });
    try {
      print("API Fetching Started");
      const url = "https://jsonplaceholder.typicode.com/posts";
      final uri = Uri.parse(url);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final List jsonData = jsonDecode(response.body);
        setState(() {
          users = jsonData;
        });
        print('Data Fetched Successfully');
      } else {
        setState(() {
          errorMessage = "Failed to load data: ${response.statusCode}";
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = "An error occurred while fetching data. Please check your internet connection.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.brown,
        title: const Text(
          'Assignment Page',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown,
        child: const Icon(Icons.replay_outlined, color: Colors.white),
        onPressed: fetchApi,
      ),
      body: errorMessage != null
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error, color: Colors.red, size: 50),
                    const SizedBox(height: 10),
                    Text(
                      errorMessage!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16, color: Colors.red),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: fetchApi,
                      child: const Text("Retry"),
                    ),
                  ],
                ),
              ),
            )
          : users.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "User ID: ${user['userId']}  |  Post ID: ${user['id']}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.brown,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              user['title'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              user['body'],
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
