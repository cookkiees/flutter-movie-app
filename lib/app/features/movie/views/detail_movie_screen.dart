import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../services/app_constant.dart';
import '../../dashboard/dashboard_controller.dart';
import 'package:fluttermovieapp/app/router/app_routers.dart';
import '../../home/widgets/custom_title.dart';
import '../../home/views/youtube_player_screen.dart';

class DetailMovie extends GetView<DashboardController> {
  const DetailMovie({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () async {
      await controller.getDetailMovie(Get.parameters["id"]);
      await controller.getSimilarMovie(Get.parameters["id"]);
      await controller.getCreditMovie(Get.parameters["id"]);
      await controller.getImageMovie(Get.parameters["id"]);
      await controller.getVideosMovie(Get.parameters["id"]);
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
                        padding:
                            const EdgeInsets.only(top: 8, right: 16, bottom: 8),
                        child: Container(
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black26),
                          child: GestureDetector(
                            child: const Icon(Icons.favorite_border),
                          ),
                        ),
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
                              controller.detailMovie?.posterPath == null
                                  ? "https://mardizu.co.id/assets/images/client/default.png"
                                  : "${AppConstant.imageUrlOrigin}${controller.detailMovie?.posterPath}",
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Padding(
                            padding: const EdgeInsets.only(left: 12, right: 16),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                controller.detailMovie == null
                                    ? ""
                                    : "${controller.detailMovie?.title}"
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
                              controller.detailMovie == null
                                  ? ""
                                  : "IMDB ${controller.detailMovie?.voteAverage?.roundToDouble()}"
                                      .toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          const Icon(
                            Icons.timelapse,
                            color: Colors.white,
                          ),
                          Text(
                            controller.detailMovie == null
                                ? ""
                                : "${controller.detailMovie?.runtime.toString()}",
                            style: const TextStyle(color: Colors.white),
                          ),
                          const Icon(
                            Icons.calendar_month,
                            color: Colors.white,
                          ),
                          Text(
                            controller.detailMovie == null
                                ? ""
                                : "${controller.detailMovie?.releaseDate.toString()}",
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
                          itemCount: controller.detailMovie == null
                              ? 0
                              : controller.detailMovie?.genres?.length,
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
                                  controller.detailMovie?.genres?[index].name ??
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
                        controller.detailMovie == null
                            ? ""
                            : "${controller.detailMovie?.overview.toString()}",
                        style: const TextStyle(color: Colors.white),
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
                              height: 120,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  var name = controller.creditMovie == null
                                      ? ""
                                      : "${controller.creditMovie?.cast?[index].name}";

                                  var firstName = name.split(" ");

                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, bottom: 8),
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 34,
                                          foregroundImage: NetworkImage(
                                            controller.creditMovie?.cast![index]
                                                        .profilePath ==
                                                    null
                                                ? "https://mardizu.co.id/assets/images/client/default.png"
                                                : "${AppConstant.imageUrlOrigin}${controller.creditMovie?.cast?[index].profilePath}",
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          controller.creditMovie == null
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
                          title: 'Previews', myOnTap: () {}, seeMore: "")),
                  SliverToBoxAdapter(
                    child: Obx(
                      () => controller.isLoading.value ||
                              controller.youtubeKey.isNotEmpty
                          ? const Visibility(
                              visible: false,
                              child: CircularProgressIndicator())
                          : SizedBox(
                              height: 200,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.videosMovie == null
                                    ? 0
                                    : controller.videosMovie!.results!.length,
                                itemBuilder: (context, index) {
                                  var key = controller
                                      .videosMovie!.results![index].key;

                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8, left: 16, right: 8, bottom: 16),
                                    child: Stack(
                                      children: [
                                        SizedBox(
                                          width: 300,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.network(
                                              YoutubePlayer.getThumbnail(
                                                  videoId: controller
                                                      .videosMovie!
                                                      .results![index]
                                                      .key!),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Positioned.fill(
                                            child: Center(
                                          child: GestureDetector(
                                            onTap: () =>
                                                Get.to(() => YouTubeScreen(
                                                      youtubeKey: key!,
                                                    )),
                                            child: Container(
                                              height: 50,
                                              width: 60,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 6.0),
                                              decoration: BoxDecoration(
                                                color: Colors.amber,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: const Icon(
                                                Icons.play_arrow,
                                                color: Colors.white,
                                                size: 32,
                                              ),
                                            ),
                                          ),
                                        ))
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
                    title: 'Similar Movies',
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
                                itemCount: controller.similarMovie.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8, left: 16, right: 8),
                                    child: GestureDetector(
                                      onTap: () {
                                        if (controller
                                            .similarMovie.isNotEmpty) {
                                          Get.toNamed(
                                              '${AppRouters.detailMovie}/${controller.similarMovie[index].id}');
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
                                                controller.similarMovie.isEmpty
                                                    ? "${AppConstant.imageUrlOrigin}${controller.similarMovie[index].backdropPath}"
                                                    : "${AppConstant.imageUrlOrigin}${controller.similarMovie[index].posterPath}",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 16,
                                            ),
                                            Text(
                                              controller.similarMovie.isEmpty
                                                  ? ""
                                                  : "${controller.similarMovie[index].originalTitle}",
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
