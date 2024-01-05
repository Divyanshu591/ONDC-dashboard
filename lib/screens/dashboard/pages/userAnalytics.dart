  import 'package:flutter/material.dart';
  import '../../../features/shared/sidebar.dart';

  class UserAnalytics extends StatelessWidget {
    const UserAnalytics({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          child: Row(
            children: [
              // Sidebar
              const Sidebar(),
              // Main content area
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 24, 32, 24), // Add padding
                  child: Container(
                    color: Colors.white, // Set white background color for the entire page
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Four cards in the first row
                              Expanded(child: _buildCard('ONBOARD SELLERS', Icons.smartphone, Color(0xFF00C6B1))),
                              Expanded(child: _buildCard('ONBOARD SELLERS', Icons.person, Color(0xFF00C6B1))),
                              Expanded(child: _buildCard('ONBOARD SELLERS', Icons.loop, Color(0xFF00C6B1))),
                              Expanded(child: _buildCard('ONBOARD SELLERS', Icons.group, Color(0xFF00C6B1))),
                            ],
                          ),
                        ),
                        // Add more content here if needed
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget _buildCard(String title, IconData icon, Color iconColor) {
      return Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 120, // Adjust the height as desired
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(icon, color: iconColor), // Apply color to the icon
                        const SizedBox(width: 8),
                        Text(title),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      child: Column(
                        children: [
                          Align(  alignment: Alignment.topRight,
                              child:
                          Text('Total')),
                          const SizedBox(width: 8), // Adjust this value accordingly
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text('50,000', style: TextStyle(fontSize: 25, color: Colors.black)),
                          const SizedBox(width: 8),// Adjust this value accordingly
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text('3869 Today', style: TextStyle(fontSize: 10, color: Color(0xFF00C6B1))),
                          const SizedBox(width: 8),//// Adjust this value accordingly
                          // Adjust this value accordingly
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
