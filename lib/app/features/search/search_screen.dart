import 'package:flutter/material.dart';
import 'package:fluttermovieapp/app/features/movie/movie_model/movie_model.dart';

import 'package:get/get.dart';

import '../../router/app_routers.dart';
import '../../services/app_constant.dart';
import '../dashboard/dashboard_controller.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  DashboardController controller = DashboardController();

  var query = "";
  List<Results> find = <Results>[].obs;

  @override
  Widget build(BuildContext context) {
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
                      child: IconButton(
                        onPressed: () async {
                          setState(() {
                            find.clear();
                            if (query.isEmpty) {
                            } else {
                              controller.getSearch(query);
                            }
                          });
                        },
                        icon: Image.asset('assets/icons/Zoom.png'),
                      )),
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
                        setState(() {
                          query = value;
                        });
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () => controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: GridView.builder(
                          padding:
                              const EdgeInsets.only(right: 8, left: 8, top: 8),
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
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white30,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      // ignore: unnecessary_null_comparison
                                      controller.search == null
                                          ? "https://mardizu.co.id/assets/images/client/default.png"
                                          : "${AppConstant.imageUrlOrigin}${controller.search[index].posterPath}",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
              ),
              Obx(() => controller.isLoading.value
                  ? const CircularProgressIndicator()
                  : SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: GridView.builder(
                        padding:
                            const EdgeInsets.only(right: 8, left: 8, top: 8),
                        scrollDirection: Axis.vertical,
                        itemCount: controller.topRated == null
                            ? 0
                            : controller.topRated!.results!.length,
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
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white30,
                                    borderRadius: BorderRadius.circular(8)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    // ignore: unnecessary_null_comparison
                                    controller.topRated == null
                                        ? "https://mardizu.co.id/assets/images/client/default.png"
                                        : "${AppConstant.imageUrlOrigin}${controller.topRated!.results![index].posterPath}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ))
            ],
          ),
        ));
  }
}
