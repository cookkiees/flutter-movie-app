import 'package:flutter/material.dart';
import 'package:fluttermovieapp/app/features/account/account_screen.dart';
import 'package:fluttermovieapp/app/features/dashboard/dashboard_controller.dart';
import 'package:fluttermovieapp/app/features/home/home_screen.dart';
import 'package:fluttermovieapp/app/features/movie/movie_screen.dart/detail_movie_screen.dart';
import 'package:fluttermovieapp/app/features/search/search_screen.dart';

import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return Scaffold(
        body: IndexedStack(
          index: controller.tabIndex,
          children: [
            HomeScreen(),
            SearchScreen(),
            AccountScreen(),
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
                icon: Icon(Icons.favorite_border),
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
