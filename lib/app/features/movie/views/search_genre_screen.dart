import 'package:flutter/material.dart';
import 'package:fluttermovieapp/app/features/dashboard/dashboard_controller.dart';
import 'package:get/get.dart';

import '../../../router/app_routers.dart';
import '../../../services/app_constant.dart';

class SearchGenreScreen extends GetView<DashboardController> {
  const SearchGenreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () async {
      await controller.getGenreMovie(Get.parameters["genreIds"]);
      controller.getPopularMovie(Get.parameters["genreIds"]);
    });

    return Obx(
      () => controller.isLoading.value
          ? const Visibility(visible: false, child: CircularProgressIndicator())
          : Scaffold(
              backgroundColor: const Color(0xFF2A2937),
              body: CustomScrollView(
                scrollDirection: Axis.vertical,
                slivers: [
                  SliverAppBar(
                    elevation: 0,
                    pinned: false,
                    snap: true,
                    floating: true,
                    backgroundColor: Colors.transparent,
                    automaticallyImplyLeading: false,
                    leadingWidth: 60,
                    title: Text("${Get.parameters["name"]}".toUpperCase()),
                    leading: Padding(
                      padding:
                          const EdgeInsets.only(top: 8, left: 16, bottom: 8),
                      child: GestureDetector(
                        onTap: () => Get.toNamed(AppRouters.dashboard),
                        child: Container(
                          padding: const EdgeInsets.only(left: 8),
                          width: 40,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black26),
                          child: const Icon(
                            Icons.arrow_back_ios,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Obx(
                      () => controller.isLoadingMore.value
                          ? const Visibility(
                              visible: false,
                              child: CircularProgressIndicator())
                          : IntrinsicHeight(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                child: GridView.builder(
                                  controller: controller.scrollController,
                                  shrinkWrap: false,
                                  padding: const EdgeInsets.only(
                                      right: 8, left: 8, top: 8),
                                  scrollDirection: Axis.vertical,
                                  itemCount: controller.popularMovie.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: 2 / 3,
                                          crossAxisCount: 3),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.toNamed(
                                              '${AppRouters.detailMovie}/${controller.popularMovie[index].id}');
                                        },
                                        child: Stack(
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
                                                  controller.popularMovie[index]
                                                              .posterPath ==
                                                          null
                                                      ? "https://mardizu.co.id/assets/images/client/default.png"
                                                      : "${AppConstant.imageUrlOrigin}${controller.popularMovie[index].posterPath}",
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
                                                  bottomRight:
                                                      Radius.circular(8),
                                                  topLeft: Radius.circular(8),
                                                ),
                                              ),
                                              child: Text(
                                                controller.popularMovie[index]
                                                            .voteAverage ==
                                                        null
                                                    ? ""
                                                    : "IMDB ${controller.popularMovie[index].voteAverage!.roundToDouble()}"
                                                        .toString(),
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
