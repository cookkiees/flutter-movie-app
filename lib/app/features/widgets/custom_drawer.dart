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
              child: Text(
                'MOVIES',
                style: TextStyle(color: Colors.amber, fontSize: 25),
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
                Icons.cloud_download_outlined,
                color: Colors.white,
              ),
              title: Text(
                'Cloud',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
