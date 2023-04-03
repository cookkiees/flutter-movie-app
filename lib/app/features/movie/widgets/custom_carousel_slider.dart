import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../router/app_routers.dart';
import '../../../services/app_constant.dart';
import '../../dashboard/dashboard_controller.dart';

class CustomCarouselSlider extends GetView<DashboardController> {
  const CustomCarouselSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () async {
      controller.getDiscoverMovie(2);
    });
    return Obx(() => controller.isLoading.value
        ? const Visibility(visible: false, child: CircularProgressIndicator())
        : CarouselSlider.builder(
            itemCount: controller.discoverMovie.isEmpty
                ? 0
                : controller.discoverMovie.length,
            options: CarouselOptions(
              enlargeCenterPage: true,
              autoPlayCurve: Curves.decelerate,
              aspectRatio: 16 / 8,
              autoPlay: true,
            ),
            itemBuilder: ((context, index, realIndex) {
              return GestureDetector(
                onTap: () {
                  if (controller.discoverMovie.isNotEmpty) {
                    Get.toNamed(
                      '${AppRouters.detailMovie}/${controller.discoverMovie[index].id}',
                    );
                  }
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 3,
                  width: MediaQuery.of(context).size.width * 2,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16)),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          controller.discoverMovie.isEmpty
                              ? "https://mardizu.co.id/assets/images/client/default.png"
                              : "${AppConstant.imageUrlW500}${controller.discoverMovie[index].backdropPath}",
                          fit: BoxFit.cover,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return const Text('😢');
                          },
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 8,
                        child: Container(
                          padding: const EdgeInsets.only(top: 8),
                          width: 200,
                          height: 80,
                          child: Text(
                            controller.discoverMovie.isEmpty
                                ? ""
                                : " ${controller.discoverMovie[index].title}"
                                    .toUpperCase(),
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          height: double.tryParse('1 + 1'),
                          width: double.tryParse('1 + 1'),
                          decoration: const BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                          ),
                          child: Text(
                            controller.discoverMovie.isEmpty
                                ? ""
                                : "IMDB ${controller.discoverMovie[index].voteAverage!.ceilToDouble()}"
                                    .toString(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ));
  }
}
