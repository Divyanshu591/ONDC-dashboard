import 'package:flutter/material.dart';
import '../../../features/shared/sidebar.dart';
import 'package:fl_chart/fl_chart.dart';

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
                padding: const EdgeInsets.fromLTRB(8, 24, 32, 24),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth < 600) {
                      return _buildMobileView();
                    } else if (constraints.maxWidth < 900) {
                      return _buildTabletView();
                    } else {
                      return _buildDesktopView();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileView() {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize:
              MainAxisSize.min, // Ensure minimum vertical space is used
          children: [
            _buildCard('ONBOARD SELLERS', Icons.smartphone, Color(0xFF00C6B1)),
            _buildCard('ONBOARD SELLERS', Icons.person, Color(0xFF00C6B1)),
            _buildCard('ONBOARD SELLERS', Icons.loop, Color(0xFF00C6B1)),
            _buildCard('ONBOARD SELLERS', Icons.group, Color(0xFF00C6B1)),
            const SizedBox(height: 20),
            // Add more content here if needed
          ],
        ),
      ),
    );
  }

  Widget _buildTabletView() {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                _buildCard(
                    'ONBOARD SELLERS', Icons.smartphone, Color(0xFF00C6B1)),
                _buildCard('ONBOARD SELLERS', Icons.loop, Color(0xFF00C6B1)),
                // Add more cards as needed
              ],
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                _buildCard('ONBOARD SELLERS', Icons.person, Color(0xFF00C6B1)),
                _buildCard('ONBOARD SELLERS', Icons.group, Color(0xFF00C6B1)),
                // Add more cards as needed
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopView() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 32, 0),
        child: Column(
          children: [
            // Row for Cards
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: _buildCard(
                        'ONBOARD SELLERS', Icons.smartphone, Color(0xFF00C6B1)),
                  ),
                  Expanded(
                    child: _buildCard(
                        'ONBOARD SELLERS', Icons.person, Color(0xFF00C6B1)),
                  ),
                  Expanded(
                    child: _buildCard(
                        'ONBOARD SELLERS', Icons.loop, Color(0xFF00C6B1)),
                  ),
                  Expanded(
                    child: _buildCard(
                        'ONBOARD SELLERS', Icons.group, Color(0xFF00C6B1)),
                  ),
                ],
              ),
            ),
            // Row for Line Charts
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                        color: Color(0xFFF3FCFB),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 200,
                          child: _buildLineChart(
                              1), // First line chart with time on y-axis
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                        color: Color(0xFF00C6B1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 200,
                          // child: _buildLineChart(
                          //     2), // Second line chart with weekdays on x-axis
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLineChart(int chartNumber) {
    if (chartNumber == 1) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: LineChart(
            LineChartData(
              minX: 0,
              maxX: 24,
              minY: 0,
              maxY: 50,
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                drawHorizontalLine: true, // Remove horizontal lines
                verticalInterval: 1,
                horizontalInterval: 10,
                getDrawingVerticalLine: (value) {
                  return FlLine(
                    color: Colors.grey,
                    strokeWidth: 0,
                    dashArray: [5],
                  );
                },
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: [
                    FlSpot(0, 1),
                    FlSpot(3, 8),
                    FlSpot(6, 4),
                    FlSpot(9, 12),
                    FlSpot(12, 5),
                    FlSpot(15, 14),
                    FlSpot(18, 17),
                    FlSpot(21, 20),
                    FlSpot(24, 23),
                  ],
                  isCurved: true,
                  colors: [Colors.blue],
                  barWidth: 2,
                  isStrokeCapRound: true,
                  belowBarData: BarAreaData(show: false),
                  dotData: FlDotData(show: false), // Remove dots on the line
                ),
              ],
              titlesData: FlTitlesData(
                bottomTitles: SideTitles(
                  showTitles: true,
                  getTitles: (value) {
                    switch (value.toInt()) {
                      case 0:
                        return '12 AM';
                      case 3:
                        return '3 AM';
                      case 6:
                        return '6 AM';
                      case 9:
                        return '9 AM';
                      case 12:
                        return '12 PM';
                      case 15:
                        return '3 PM';
                      case 18:
                        return '6 PM';
                      case 21:
                        return '9 PM';
                      case 24:
                        return '12 AM';
                    }
                    return '';
                  },
                ),
                leftTitles: SideTitles(
                  showTitles: true,
                  getTitles: (value) {
                    return value.toInt().toString(); // Show complete y-axis values
                  },
                  margin: 8,
                ),
                rightTitles: SideTitles(showTitles: false),
                topTitles: SideTitles(showTitles: false),
              ),
              borderData: FlBorderData(
                show: false,
                border: Border.all(color: Colors.grey, width: 0.5),
              ),
            ),
          ),
        ),
      );
    } else if (chartNumber == 2) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              LineChart(
                LineChartData(
                  minX: 0,
                  maxX: 6,
                  minY: 0,
                  maxY: 1500,
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: true,
                    drawHorizontalLine: true,
                    verticalInterval: 1, // Change this as needed for vertical lines
                    horizontalInterval: 200, // Change this as needed for horizontal lines
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 100),
                        FlSpot(3, 800),
                        FlSpot(6, 400),
                        FlSpot(9, 1200),
                        FlSpot(12, 500),
                        FlSpot(15, 1400),
                        FlSpot(18, 700),
                        FlSpot(21, 1000),
                        FlSpot(24, 200),
                      ],
                      isCurved: true,
                      colors: [Colors.blue],
                      barWidth: 4,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                  titlesData: FlTitlesData(
                    bottomTitles: SideTitles(
                      showTitles: true,
                      getTitles: (value) {
                        switch (value.toInt()) {
                          case 0:
                            return 'Mon';
                          case 1:
                            return 'Tue';
                          case 2:
                            return 'Wed';
                          case 3:
                            return 'Thu';
                          case 4:
                            return 'Fri';
                          case 5:
                            return 'Sat';
                          case 6:
                            return 'Sun';
                        }
                        return '';
                      },
                    ),
                    leftTitles: SideTitles(
                      showTitles: true,
                      getTitles: (value) {
                        if (value.toInt() % 200 == 0) {
                          return value.toInt().toString();
                        }
                        return '';
                      },
                    ),
                    rightTitles: SideTitles(showTitles: false),
                    topTitles: SideTitles(showTitles: false),
                  ),
                  borderData: FlBorderData(
                    show: false, // Hide border
                  ),
                ),
              ),
              // Positioned(
              //   top: 8,
              //   right: 8,
              //   child: DropdownButton<String>(
              //     // ... (dropdown button setup)
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return SizedBox(); // Return an empty container for any other chartNumber
    }
  }


  Widget _buildCard(String title, IconData icon, Color iconColor) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Icon(icon, color: iconColor),
                          const SizedBox(width: 8),
                          Text(title),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('Total'),
                          const SizedBox(width: 8),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '50,000',
                            style: TextStyle(fontSize: 25, color: Colors.black),
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '3869 Today',
                            style: TextStyle(
                                fontSize: 10, color: Color(0xFF00C6B1)),
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
