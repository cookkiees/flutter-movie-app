import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttermovieapp/app/features/dashboard/dashboard_controller.dart';

import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../router/app_routers.dart';
import '../../services/app_constant.dart';

class CustomCarouselSlider extends GetView<DashboardController> {
  const CustomCarouselSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () async {
      controller.getDiscover(7);
    });
    return Obx(() => controller.isLoading.value
        ? const Visibility(visible: false, child: CircularProgressIndicator())
        : CarouselSlider.builder(
            itemCount: controller.discover == null
                ? 0
                : controller.discover!.results!.length,
            options: CarouselOptions(
              enlargeCenterPage: true,
              autoPlayCurve: Curves.decelerate,
              aspectRatio: 16 / 8,
              autoPlay: true,
            ),
            itemBuilder: ((context, index, realIndex) => GestureDetector(
                  onTap: () {
                    if (controller.discover!.results != null) {
                      Get.toNamed(
                          '${AppRouters.detailMovie}/${controller.discover!.results![index].id}');
                    }
                  },
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(16)),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            controller.discover == null
                                ? "https://mardizu.co.id/assets/images/client/default.png"
                                : "${AppConstant.imageUrlOrigin}${controller.discover!.results![index].backdropPath}",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 30,
                          left: 16,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.discover == null
                                    ? ""
                                    : controller.discover!.results![index]
                                        .originalTitle!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              RatingBar.builder(
                                itemSize: 24,
                                initialRating: 4,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star_border,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  if (kDebugMode) {
                                    print(rating);
                                  }
                                },
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          ));
  }
}
