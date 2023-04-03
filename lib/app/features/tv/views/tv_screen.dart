import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../dashboard/dashboard_controller.dart';
import '../../home/widgets/custom_appbar.dart';
import '../../home/widgets/custom_drawer.dart';
import '../../home/widgets/custom_title.dart';
import '../../tv/widgets/tv_on_the_airing.dart';
import '../../tv/widgets/tv_popular.dart';
import '../../tv/widgets/tv_recommendations.dart';
import '../../tv/widgets/tv_top_rated.dart';

class TVScreen extends GetView<DashboardController> {
  const TVScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2A2937),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppbar(
          title: "TV SHOWS",
        ),
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            const TVRecommendations(),
            CustomTitle(
              title: 'TV On Airing Today',
              myOnTap: () {},
              seeMore: "See More",
            ),
            const TVOnTheAiring(
              myAxis: Axis.horizontal,
              myAspectRatio: 1 / 0.6,
              myCrossAxisCount: 1,
              myHeight: 235,
              myPadding: EdgeInsets.only(left: 8, right: 8),
              myTitle: true,
            ),
            CustomTitle(
              title: 'TV Popular',
              myOnTap: () {},
              seeMore: "See More",
            ),
            const TVPopular(
              myAxis: Axis.horizontal,
              myAspectRatio: 1 / 0.6,
              myCrossAxisCount: 1,
              myHeight: 235,
              myPadding: EdgeInsets.only(left: 8, right: 8),
              myTitle: true,
            ),
            CustomTitle(
              title: 'TV Top Rated',
              myOnTap: () {},
              seeMore: "See More",
            ),
            const TVTopRated(
              myAxis: Axis.horizontal,
              myAspectRatio: 1 / 0.6,
              myCrossAxisCount: 1,
              myHeight: 235,
              myPadding: EdgeInsets.only(left: 8, right: 8),
              myTitle: true,
            ),
          ],
        ),
      ),
    );
  }
}
