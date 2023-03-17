import 'package:flutter/material.dart';
import 'package:fluttermovieapp/app/features/home/home_controller.dart';
import 'package:get/get.dart';

class CustomTabBarView extends GetView<HomeController> {
  const CustomTabBarView({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: controller.tabController,
      children: const [
        Text('1'),
        Text('1'),
        Text('1'),
        Text('1'),
        Text('1'),
      ],
    );
  }
}
