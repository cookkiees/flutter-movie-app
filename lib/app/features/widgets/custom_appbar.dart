import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: const Text('MOVIES'),
      leading: Padding(
        padding: const EdgeInsets.only(left: 8, top: 8),
        child: Builder(
          builder: (context) => Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: Colors.white30),
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
          padding: const EdgeInsets.only(top: 8),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: Colors.white30),
            child: GestureDetector(
              child: Image.asset('assets/icons/Zoom.png'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 8),
          child: Container(
            width: 48,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: Colors.white30),
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