import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          GestureDetector(
            onTap: () {},
            child: const Text(
              'See More',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
