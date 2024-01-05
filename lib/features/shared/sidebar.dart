import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  bool isCollapsed = true; // Set default to collapsed
  IconData? selectedItem; // Initially selected item

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 24, 32, 24),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: isCollapsed ? 70 : 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // Wrapping the ListTile with a Container and providing background color
              color: !isCollapsed ? const Color(0xFFF3FCFB) : null,
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                title: Row(
                  children: [
                    Switch(
                      value: !isCollapsed,
                      onChanged: (value) {
                        setState(() {
                          isCollapsed = !value;
                        });
                      },
                      activeColor: const Color(0xFF00C6B1),
                    ),
                    if (!isCollapsed)
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Text(
                              'Live Dashboard',
                              style: TextStyle(
                                color: Color(0xFF00C6B1),
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                onTap: () {
                  setState(() {
                    isCollapsed = !isCollapsed;
                  });
                },
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isCollapsed) ...[
                        _buildIcon(Icons.analytics),
                        _buildIcon(Icons.bar_chart),
                        _buildIcon(Icons.dashboard),
                        _buildIcon(Icons.storage),
                        _buildIcon(Icons.upload),
                        _buildIcon(Icons.receipt),
                        _buildIcon(Icons.support),
                        _buildIcon(Icons.notifications),
                        const SizedBox(height: 8),
                      ] else ...[
                        _buildSelectableItem(Icons.analytics, 'User Analytics'),
                        const SizedBox(height: 8),
                        _buildSelectableItem(Icons.bar_chart, 'Sales Analytics'),
                        _buildSelectableItem(Icons.dashboard, 'KPI Dashboard'),
                        _buildSelectableItem(Icons.storage, 'MDM'),
                        _buildSelectableItem(Icons.upload, 'Banner Upload'),
                        _buildSelectableItem(Icons.receipt, 'Reports'),
                        _buildSelectableItem(Icons.support, 'Support'),
                        _buildSelectableItem(Icons.notifications, 'Notification'),
                        const SizedBox(height: 8),
                      ],
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

  Widget _buildSelectableItem(IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedItem = icon;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: selectedItem == icon ? const Color(0xFFF3FCFB) : null, // Background color when selected
          border: Border.all(
            color: selectedItem == icon ? const Color(0xFF00C6B1) : Colors.transparent,
            width: 2, // Border width
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          leading: Icon(
            icon,
            color: selectedItem == icon ? const Color(0xFF00C6B1) : Colors.grey, // Selected icon color
          ),
          title: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: selectedItem == icon ? const Color(0xFF00C6B1) : Colors.grey, // Selected text color
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(IconData icon) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12), // Adjusted horizontal padding
      leading: Icon(
        icon,
        color: Colors.grey, // Light grey color
      ),
      title: const SizedBox.shrink(),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Sidebar(),
  ));
}
