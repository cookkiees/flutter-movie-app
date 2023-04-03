import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../services/app_constant.dart';
import '../../dashboard/dashboard_controller.dart';
import 'package:fluttermovieapp/app/router/app_routers.dart';
import '../../home/widgets/custom_title.dart';

class TVDetailsScreen extends GetView<DashboardController> {
  const TVDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () async {
      await controller.getTVDetails(Get.parameters["id"]);
      await controller.getTVSimilar(Get.parameters["id"]);
      await controller.getTVCredits(Get.parameters["id"]);
    });

    return Obx(
      () => controller.isLoading.value
          ? const Visibility(visible: false, child: CircularProgressIndicator())
          : Scaffold(
              backgroundColor: const Color.fromARGB(255, 16, 15, 20),
              body: CustomScrollView(
                reverse: false,
                dragStartBehavior: DragStartBehavior.down,
                scrollDirection: Axis.vertical,
                slivers: [
                  SliverAppBar(
                    elevation: 0,
                    pinned: false,
                    snap: false,
                    floating: false,
                    backgroundColor: const Color.fromARGB(255, 16, 15, 20),
                    automaticallyImplyLeading: false,
                    expandedHeight: MediaQuery.of(context).size.height / 2,
                    leadingWidth: 60,
                    leading: Padding(
                      padding:
                          const EdgeInsets.only(top: 8, left: 16, bottom: 8),
                      child: GestureDetector(
                        onTap: () => Get.back(),
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
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 16, right: 16, bottom: 16),
                        child: GestureDetector(
                          child: const Icon(
                            Icons.favorite_border_outlined,
                            size: 26,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                    ],
                    flexibleSpace: Stack(
                      children: [
                        FlexibleSpaceBar(
                          background: ShaderMask(
                            shaderCallback: (rectangle) {
                              return const LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Colors.black,
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ).createShader(
                                Rect.fromLTRB(
                                    0, 0, rectangle.width, rectangle.height),
                              );
                            },
                            blendMode: BlendMode.dstIn,
                            child: Image.network(
                              controller.tvDetails?.posterPath == null
                                  ? "https://mardizu.co.id/assets/images/client/default.png"
                                  : "${AppConstant.imageUrlOrigin}${controller.tvDetails?.posterPath}",
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Padding(
                            padding: const EdgeInsets.only(left: 12, right: 16),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                controller.tvDetails == null
                                    ? ""
                                    : "${controller.tvDetails?.name}"
                                        .toUpperCase(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16, bottom: 8, top: 8, right: 64),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            height: double.tryParse('1 + 1'),
                            width: double.tryParse('1 + 1'),
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              controller.tvDetails == null
                                  ? ""
                                  : "IMDB ${controller.tvDetails?.voteAverage?.roundToDouble()}"
                                      .toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Text(
                            controller.tvDetails == null
                                ? ""
                                : "Eps: ${controller.tvDetails!.numberOfEpisodes}",
                            style: const TextStyle(color: Colors.white),
                          ),
                          const Icon(
                            Icons.calendar_month,
                            color: Colors.white,
                          ),
                          Text(
                            controller.tvDetails == null
                                ? ""
                                : "${controller.tvDetails!.firstAirDate}",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16, left: 16),
                      child: SizedBox(
                        height: 45,
                        width: double.maxFinite,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.tvDetails == null
                              ? 0
                              : controller.tvDetails?.genres?.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                right: 8,
                                top: 16,
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(6.0),
                                height: double.tryParse('1 + 1'),
                                width: double.tryParse('1 2 3'),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Text(
                                  controller.tvDetails?.genres?[index].name ??
                                      "",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        controller.tvDetails == null
                            ? ""
                            : "${controller.tvDetails?.overview.toString()}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Obx(
                      () => controller.isLoading.value
                          ? const Visibility(
                              visible: false,
                              child: CircularProgressIndicator())
                          : Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, right: 8, bottom: 16),
                              child: SizedBox(
                                height: 60,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller
                                      .tvDetails?.productionCompanies!.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 2),
                                        width: 100,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.white,
                                        ),
                                        child: Image.network(
                                          controller
                                                      .tvDetails
                                                      ?.productionCompanies![
                                                          index]
                                                      .logoPath ==
                                                  null
                                              ? "https://mardizu.co.id/assets/images/client/default.png"
                                              : "${AppConstant.imageUrlOrigin}${controller.tvDetails?.productionCompanies?[index].logoPath}",
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(right: 16, left: 8, bottom: 8),
                      child: SizedBox(
                        height: 220,
                        width: double.maxFinite,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.tvDetails == null
                              ? 0
                              : controller.tvDetails!.seasons!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, left: 8, right: 8),
                              child: SizedBox(
                                width: 120,
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        controller.tvDetails!.seasons![index]
                                                    .posterPath ==
                                                null
                                            ? "https://mardizu.co.id/assets/images/client/default.png"
                                            : "${AppConstant.imageUrlOrigin}${controller.tvDetails!.seasons![index].posterPath}",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      controller.tvDetails!.seasons!.isEmpty
                                          ? ""
                                          : "${controller.tvDetails!.seasons![index].name}",
                                      style: const TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: CustomTitle(
                        title: 'Created by', myOnTap: () {}, seeMore: ""),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.tvDetails == null
                            ? 0
                            : controller.tvDetails!.createdBy!.length,
                        itemBuilder: (context, index) {
                          var name = controller.tvDetails == null
                              ? ""
                              : "${controller.tvDetails!.createdBy![index].name}";

                          var firstName = name.split(" ");

                          return Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: SizedBox(
                              width: 80,
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 34,
                                    foregroundImage: NetworkImage(
                                      controller.tvDetails!.createdBy![index]
                                                  .profilePath ==
                                              null
                                          ? "https://mardizu.co.id/assets/images/client/default.png"
                                          : "${AppConstant.imageUrlOrigin}${controller.tvDetails?.createdBy?[index].profilePath}",
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    controller.tvDetails == null
                                        ? ""
                                        : firstName[0],
                                    style: const TextStyle(
                                      color: Colors.white,
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
                  SliverToBoxAdapter(
                    child: CustomTitle(
                        title: 'Top Cast', myOnTap: () {}, seeMore: ""),
                  ),
                  SliverToBoxAdapter(
                    child: Obx(
                      () => controller.isLoading.value
                          ? const Visibility(
                              visible: false,
                              child: CircularProgressIndicator())
                          : SizedBox(
                              height: 100,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.tvCredits?.cast!.length,
                                itemBuilder: (context, index) {
                                  var name = controller.tvCredits == null
                                      ? ""
                                      : "${controller.tvCredits?.cast?[index].name}";

                                  var firstName = name.split(" ");

                                  return SizedBox(
                                    width: 90,
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 34,
                                          foregroundImage: NetworkImage(
                                            controller.tvCredits?.cast![index]
                                                        .profilePath ==
                                                    null
                                                ? "https://mardizu.co.id/assets/images/client/default.png"
                                                : "${AppConstant.imageUrlOrigin}${controller.tvCredits?.cast?[index].profilePath}",
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          controller.tvCredits == null
                                              ? ""
                                              : firstName[0],
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                    ),
                  ),
                  SliverToBoxAdapter(
                      child: CustomTitle(
                    title: 'Similar TV',
                    myOnTap: () {},
                    seeMore: "",
                  )),
                  SliverToBoxAdapter(
                    child: Obx(
                      () => controller.isLoading.value
                          ? const Visibility(
                              visible: false,
                              child: CircularProgressIndicator())
                          : SizedBox(
                              height: 250,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.tvSimilar.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8, left: 16, right: 8),
                                    child: GestureDetector(
                                      onTap: () {
                                        if (controller.tvSimilar.isNotEmpty) {
                                          Get.toNamed(
                                              '${AppRouters.tvDetails}/${controller.tvSimilar[index].id}');
                                        }
                                      },
                                      child: SizedBox(
                                        width: 120,
                                        child: Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image.network(
                                                controller.tvSimilar.isEmpty
                                                    ? "https://mardizu.co.id/assets/images/client/default.png"
                                                    : "${AppConstant.imageUrlOrigin}${controller.tvSimilar[index].posterPath}",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 16,
                                            ),
                                            Text(
                                              controller.tvSimilar.isEmpty
                                                  ? ""
                                                  : "${controller.tvSimilar[index].name}",
                                              style: const TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color: Colors.white),
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
                  ),
                ],
              ),
            ),
    );
  }
}
