import 'package:flutter/material.dart';

import "package:get/get.dart";
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../services/app_constants.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/custom_list_view.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_carousel_slider.dart';
import '../widgets/custom_title.dart';
import 'home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      controller.genreMovie();
    });
    return Scaffold(
      backgroundColor: const Color(0xFF2A2937),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppbar(),
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            const CustomCarouselSlider(),
            const SizedBox(height: 16),
            const CustomTitle(
              title: "Top Rated Movies",
            ),
            const SizedBox(height: 8),
            CustomListView(
              Future.delayed(
                Duration.zero,
                () async {
                  await controller.getTopRated(2);
                },
              ),
            ),
            const CustomTitle(
              title: "Popular Movies",
            ),
            const SizedBox(height: 8),
            CustomListView(
              Future.delayed(
                Duration.zero,
                () async {
                  await controller.getPopular(0);
                },
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const CustomTitle(
              title: "Genre",
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 300,
              child: GridView.builder(
                cacheExtent: 5,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 5,
                    childAspectRatio: 16 / 9,
                    crossAxisCount: 3),
                itemBuilder: (ctx, i) {
                  return Stack(
                    children: [
                      Opacity(
                        opacity: 0.5,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            controller.dataMovie == null
                                ? "https://mardizu.co.id/assets/images/client/default.png"
                                : "${AppConstant.imageUrlOrigin}${controller.dataMovie!.results![i].backdropPath}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          controller.dataGenre == null
                              ? ""
                              : controller.dataGenre!.genres![i].name!,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
