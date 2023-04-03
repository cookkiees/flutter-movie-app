import 'package:flutter/material.dart';
import "package:get/get.dart";
import '../../../router/app_routers.dart';
import '../../../services/app_constant.dart';
import '../../dashboard/dashboard_controller.dart';
import '../widgets/custom_appbar.dart';
import '../../movie/widgets/custom_carousel_slider.dart';
import '../widgets/custom_drawer.dart';
import '../../movie/widgets/custom_popular.dart';
import '../widgets/custom_title.dart';
import '../../movie/widgets/custom_top_rated.dart';
import '../../movie/widgets/custom_up_coming.dart';

class HomeScreen extends GetView<DashboardController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () async {
      await controller.getTrendingMovie("movie", "day");
      await controller.getTopRatedMovie(2);
    });
    return Scaffold(
      backgroundColor: const Color(0xFF2A2937),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppbar(
          title: "MOVIES",
        ),
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            const CustomCarouselSlider(),
            CustomTitle(seeMore: "", myOnTap: () {}, title: "Tranding Today"),
            const SizedBox(height: 16),
            Obx(
              () => controller.isLoading.value
                  ? const Visibility(
                      visible: false, child: CircularProgressIndicator())
                  : SizedBox(
                      height: 235,
                      child: GridView.builder(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.trendingMovie?.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 1 / 0.6, crossAxisCount: 1),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: GestureDetector(
                              onTap: () {
                                if (controller.trendingMovie != null) {
                                  Get.toNamed(
                                      '${AppRouters.detailMovie}/${controller.trendingMovie?[index].id}');
                                }
                              },
                              child: SizedBox(
                                width: 120,
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          height: 190,
                                          width: 120,
                                          decoration: BoxDecoration(
                                            color: Colors.white30,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.network(
                                              controller.trendingMovie == null
                                                  ? "https://mardizu.co.id/assets/images/client/default.png"
                                                  : "${AppConstant.imageUrlW500}${controller.trendingMovie?[index].posterPath}",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(6),
                                          height: double.tryParse('1 + 1'),
                                          width: double.tryParse('1 + 1'),
                                          decoration: const BoxDecoration(
                                            color: Colors.amber,
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(8),
                                              topLeft: Radius.circular(8),
                                            ),
                                          ),
                                          child: Text(
                                            controller.trendingMovie == null
                                                ? ""
                                                : "IMDB ${controller.trendingMovie?[index].voteAverage?.roundToDouble()}"
                                                    .toString(),
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      controller.trendingMovie == null
                                          ? ""
                                          : "${controller.trendingMovie?[index].originalTitle}",
                                      style: const TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ),
            CustomTitle(
                seeMore: "See More",
                myOnTap: () => Get.toNamed(AppRouters.topRatedMovie),
                title: "Top Rated Movies"),
            const SizedBox(height: 16),
            const CustomTopRated(
              myHeight: 235,
              myAspectRatio: 1 / 0.6,
              myAxis: Axis.horizontal,
              myCrossAxisCount: 1,
              myPadding: EdgeInsets.only(left: 8, right: 8),
              myTitle: true,
            ),
            const SizedBox(height: 16),
            CustomTitle(
                seeMore: "See More",
                myOnTap: () => Get.toNamed(AppRouters.popularMovie),
                title: "Popular Movies"),
            const SizedBox(height: 16),
            const CustomPopular(
              myAxis: Axis.horizontal,
              myAspectRatio: 1 / 0.6,
              myCrossAxisCount: 1,
              myHeight: 235,
              myPadding: EdgeInsets.only(left: 8, right: 8),
              myTitle: true,
            ),
            const SizedBox(height: 16),
            CustomTitle(
                seeMore: "See More", myOnTap: () {}, title: "UpComing Movies"),
            const SizedBox(height: 16),
            const CustomUpComing(
              myAxis: Axis.horizontal,
              myAspectRatio: 1 / 0.6,
              myCrossAxisCount: 1,
              myHeight: 235,
              myPadding: EdgeInsets.only(left: 8, right: 8),
              myTitle: true,
            )
          ],
        ),
      ),
    );
  }
}
