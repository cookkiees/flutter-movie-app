import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../services/app_constants.dart';
import '../home/home_controller.dart';

class CustomCarouselSlider extends GetView<HomeController> {
  const CustomCarouselSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () async {
      await controller.getDiscover(1);
    });
    return CarouselSlider.builder(
      itemCount: controller.dataMovie == null
          ? 0
          : controller.dataMovie!.results!.length,
      itemBuilder: ((context, index, realIndex) => Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    controller.dataMovie == null
                        ? "https://mardizu.co.id/assets/images/client/default.png"
                        : "${AppConstant.imageUrlOrigin}${controller.dataMovie!.results![index].backdropPath}",
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.dataMovie == null
                            ? ""
                            : controller
                                .dataMovie!.results![index].originalTitle!,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
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
          )),
      options: CarouselOptions(
        autoPlayCurve: Curves.decelerate,
        aspectRatio: 16 / 7,
        autoPlay: true,
      ),
    );
  }
}
