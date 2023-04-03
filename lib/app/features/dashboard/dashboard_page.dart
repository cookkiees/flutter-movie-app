import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../tv/views/tv_screen.dart';
import '../home/views/home_screen.dart';
import '../search/views/search_screen.dart';
import 'dashboard_controller.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return Scaffold(
        body: IndexedStack(
          index: controller.tabIndex,
          children: const [
            HomeScreen(),
            SearchScreen(),
            TVScreen(),
            Icon(Icons.abc),
          ],
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(12),
          height: 90,
          decoration: const BoxDecoration(
            color: Color(0xFF2A2937),
          ),
          child: BottomNavigationBar(
            iconSize: 24,
            currentIndex: controller.tabIndex,
            selectedItemColor: Colors.amber,
            unselectedItemColor: const Color.fromRGBO(209, 209, 209, 1),
            onTap: controller.changeTabIndex,
            backgroundColor: const Color(0xFF2A2937),
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            showUnselectedLabels: true,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.tv_outlined),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined),
                label: '',
              ),
            ],
          ),
        ),
      );
    });
  }
}
