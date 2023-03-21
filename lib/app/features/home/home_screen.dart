import 'package:flutter/material.dart';
import 'package:fluttermovieapp/app/features/widgets/custom_carousel_slider.dart';
import 'package:fluttermovieapp/app/features/widgets/custom_popular.dart';
import 'package:fluttermovieapp/app/features/widgets/custom_top_rated.dart';
import 'package:fluttermovieapp/app/features/widgets/custom_title.dart';
import 'package:fluttermovieapp/app/features/widgets/custom_up_coming.dart';

import "package:get/get.dart";
import 'package:get/get_state_manager/get_state_manager.dart';

import '../dashboard/dashboard_controller.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_drawer.dart';

class HomeScreen extends GetView<DashboardController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2A2937),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppbar(),
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(height: 16),
            CustomCarouselSlider(),
            CustomTitle(title: "Top Rated Movies"),
            SizedBox(height: 16),
            CustomTopRated(),
            CustomTitle(title: "Popular Movies"),
            SizedBox(height: 16),
            CustomPopular(),
            CustomTitle(title: "UpComing Movies"),
            SizedBox(height: 16),
            CustomUpComing()
          ],
        ),
      ),
    );
  }
}
