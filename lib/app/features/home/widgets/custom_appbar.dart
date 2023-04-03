import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(title),
      leading: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16),
        child: Builder(
          builder: (context) => Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.white30),
            child: IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Image.asset('assets/icons/menu.png'),
            ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 16, right: 8),
          child: Container(
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.white30),
            child: GestureDetector(
              child: Image.asset('assets/icons/Combined Shape.png'),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
      ],
    );
  }
}
