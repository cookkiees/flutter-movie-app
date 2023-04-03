import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../router/app_routers.dart';
import '../../../services/app_constant.dart';
import '../../dashboard/dashboard_controller.dart';

class SearchScreen extends GetView<DashboardController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      controller.getGenreMovie(Get.parameters["genreIds"]);
    });

    return Scaffold(
      backgroundColor: const Color(0xFF2A2937),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white30),
                  child: Obx(
                    () => controller.find.isEmpty
                        ? IconButton(
                            onPressed: () {
                              controller.myState();
                            },
                            icon: Image.asset('assets/icons/Zoom.png'),
                          )
                        : IconButton(
                            onPressed: () {
                              controller.myState();
                            },
                            icon: Image.asset('assets/icons/Zoom.png'),
                          ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    onChanged: (value) {
                      controller.myState2(value);
                    },
                    cursorColor: Colors.amber,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: "Search Movies",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Obx(
        () => controller.isLoading.value || controller.query.isEmpty
            ? SizedBox(
                height: MediaQuery.of(context).size.height / 1 / 1.79,
                child: GridView.builder(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 16),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.genreMovie.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 2.5 / 1.5, crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          if (controller.genreMovie.isNotEmpty) {
                            Get.toNamed(
                                '${AppRouters.genreMovie}/${controller.genreMovie[index].id}/${controller.genreMovie[index].name}');
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          child: Stack(
                            children: [
                              Opacity(
                                opacity: 0.6,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    controller.topRatedMovie.isEmpty
                                        ? "https://mardizu.co.id/assets/images/client/default.png"
                                        : "${AppConstant.imageUrlOrigin}${controller.topRatedMovie[index].backdropPath}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  controller.genreMovie.isEmpty
                                      ? ""
                                      : controller.genreMovie[index].name!,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            : IntrinsicHeight(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 205,
                  child: GridView.builder(
                    controller: controller.scrollController,
                    shrinkWrap: false,
                    padding: const EdgeInsets.only(right: 8, left: 8, top: 8),
                    scrollDirection: Axis.vertical,
                    itemCount: controller.search.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 2 / 3, crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(
                                '${AppRouters.detailMovie}/${controller.search[index].id}');
                          },
                          child: Stack(
                            children: [
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                    color: Colors.white30,
                                    borderRadius: BorderRadius.circular(8)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    controller.search[index].posterPath == null
                                        ? "https://mardizu.co.id/assets/images/client/default.png"
                                        : "${AppConstant.imageUrlW500}${controller.search[index].posterPath}",
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
                                  controller.search[index].voteAverage == null
                                      ? ""
                                      : "IMDB ${controller.search[index].voteAverage!.roundToDouble()}"
                                          .toString(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
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
    );
  }
}
