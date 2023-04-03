import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../router/app_routers.dart';
import '../../../services/app_constant.dart';
import '../../dashboard/dashboard_controller.dart';

class TVTopRated extends GetView<DashboardController> {
  const TVTopRated({
    required this.myAspectRatio,
    required this.myAxis,
    required this.myCrossAxisCount,
    required this.myHeight,
    required this.myPadding,
    required this.myTitle,
    this.scroll,
    super.key,
  });

  final double myHeight;
  final EdgeInsetsGeometry myPadding;
  final Axis myAxis;
  final ScrollController? scroll;
  final double myAspectRatio;
  final int myCrossAxisCount;
  final bool myTitle;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () async {
      controller.getTVTopRated(1);
    });

    return Obx(
      () => controller.isLoading.value
          ? const Visibility(visible: false, child: CircularProgressIndicator())
          : SizedBox(
              height: myHeight,
              child: GridView.builder(
                controller: scroll,
                padding: const EdgeInsets.only(left: 8, right: 8),
                scrollDirection: myAxis,
                itemCount: controller.tvTopRated.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: myAspectRatio,
                    crossAxisCount: myCrossAxisCount),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: GestureDetector(
                      onTap: () {
                        if (controller.tvTopRated.isNotEmpty) {
                          Get.toNamed(
                              '${AppRouters.tvDetails}/${controller.tvTopRated[index].id}');
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
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      controller.tvTopRated[index].posterPath ==
                                              null
                                          ? "${AppConstant.imageUrlW500}${controller.tvTopRated[index].backdropPath}"
                                          : "${AppConstant.imageUrlW500}${controller.tvTopRated[index].posterPath}",
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
                                    controller.tvTopRated.isEmpty
                                        ? ""
                                        : "IMDB ${controller.tvTopRated[index].voteAverage?.roundToDouble()}"
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
                            Visibility(
                              visible: myTitle,
                              child: Text(
                                controller.tvTopRated.isEmpty
                                    ? ""
                                    : "${controller.tvTopRated[index].name}",
                                style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.white,
                                ),
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
    );
  }
}
