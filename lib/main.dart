import 'package:flutter/material.dart';
import 'features/shared/header.dart';
import 'screens/dashboard/pages/userAnalytics.dart'; // Import the UserAnalyticsPage widget

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Set this to false
      title: 'Dashboard Example',
      home: const Dashboard(),
      themeMode: ThemeMode.light, // Use ThemeMode.dark for a darker theme
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[200], // Adjust the shade of grey as needed
      ),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
      appBar: Header(),
      body: Row(
        children: [
          Expanded(
            // Use Expanded to allow the UserAnalyticsPage to take up remaining space
            child: UserAnalytics(),
          ),
        ],
      ),
    );
}
