import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: SizedBox(
                height: 140,
                width: 140,
                child: Image.asset(
                  'assets/images/ondc_logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(width: 45),
            Text(
              'ONDC Dashboard',
              style: TextStyle(fontSize: 14, color: Colors.grey[500], fontFamily: 'Roboto'),
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: IconButton(
            icon: const Icon(Icons.more_vert),
            color: const Color(0xFF227C9D),
            onPressed: () {
              final RenderBox bar = context.findRenderObject() as RenderBox;
              final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
              final RelativeRect position = RelativeRect.fromRect(
                Rect.fromPoints(
                  bar.localToGlobal(bar.size.bottomRight(Offset.zero), ancestor: overlay),
                  bar.localToGlobal(bar.size.bottomRight(Offset.zero), ancestor: overlay),
                ),
                Offset.zero & overlay.size,
              );

              showMenu(
                context: context,
                position: position,
                items: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Column(
                        children: [
                          Icon(Icons.person, color: Color(0xFF227C9D)), // Change icon color
                          SizedBox(height: 10),
                          Text(
                            'Profile',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 10, color: Color(0xFF227C9D)), // Change text color
                          ),
                        ],
                      ),
                      const Column(
                        children: [
                          Icon(Icons.lock, color: Color(0xFF227C9D)), // Change icon color
                          SizedBox(height: 10),
                          Text(
                            'Change Password',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 10, color: Color(0xFF227C9D)), // Change text color
                          ),
                        ],
                      ),
                      const Column(
                        children: [
                          Icon(Icons.logout, color: Color(0xFF227C9D)), // Change icon color
                          SizedBox(height: 10),
                          Text(
                            'Logout',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 10, color: Color(0xFF227C9D)), // Change text color
                          ),
                        ],
                      ),
                    ].expand((widget) => [widget, const SizedBox(width: 10)]).toList(), // Added spacing between items
                  ),
                ].map((e) {
                  return PopupMenuItem(
                    child: e,
                    onTap: () {
                      Navigator.pop(context);
                      // Handle actions accordingly
                    },
                  );
                }).toList(),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}