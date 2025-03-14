import 'package:flutter/material.dart';
import 'package:nimal/screens/homePage.dart'; // Importing the Homepage

void main() {
  runApp(const MyApp()); // Entry point of the application
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo', // Application title
        debugShowCheckedModeBanner: false, // Removes the Debug banner from the screen
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.brown), // Color Scheme set to brown
          useMaterial3: true, // Enables Material 3 design system
        ),
        home: const Homepage()); // Redirects to the Homepage class to minimize complexity
  }
}
