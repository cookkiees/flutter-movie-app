import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF2A2937),
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            flexibleSpace: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white30),
                      child: GestureDetector(
                        child: Image.asset('assets/icons/Zoom.png'),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 16, top: 8, bottom: 8),
                      height: 50,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const TextField(
                        cursorColor: Colors.amber,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Search Movies",
                          hintStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
