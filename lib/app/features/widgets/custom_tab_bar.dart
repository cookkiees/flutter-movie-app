import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/home_controller.dart';

class CustomTabBar extends GetView<HomeController> {
  const CustomTabBar({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(6)),
      child: TabBar(
          isScrollable: true,
          controller: controller.tabController,
          tabs: const [
            Tab(
              text: 'All',
            ),
            Tab(
              text: 'Recomendation',
            ),
            Tab(
              text: 'Sport',
            ),
            Tab(
              text: 'Kids',
            ),
            Tab(
              text: 'Horor',
            )
          ]),
    );
  }
}
