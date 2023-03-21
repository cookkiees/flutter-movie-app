import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF2A2937),
        child: ListView(
          children: const [
            DrawerHeader(
              margin: EdgeInsets.only(bottom: 0),
              padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(
                'MOVIES',
                style: TextStyle(color: Colors.amber, fontSize: 25),
              ),
            ),
            ListTile(
              title: Text(
                'Menu',
                style: TextStyle(color: Colors.amber, fontSize: 16),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.message_outlined,
                color: Colors.white,
              ),
              title: Text(
                'Chat',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.people,
                color: Colors.white,
              ),
              title: Text(
                'Friendly',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.cloud_download_outlined,
                color: Colors.white,
              ),
              title: Text(
                'Cloud',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.star_border_purple500_outlined,
                color: Colors.white,
              ),
              title: Text(
                'Top Rated',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.poll_outlined,
                color: Colors.white,
              ),
              title: Text(
                'Popular',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.movie_creation_outlined,
                color: Colors.white,
              ),
              title: Text(
                'Up Coming',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            ListTile(
              title: Text(
                'General',
                style: TextStyle(color: Colors.amber, fontSize: 16),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: Text(
                'Settings',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.logout_outlined,
                color: Colors.white,
              ),
              title: Text(
                'Log Out',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
