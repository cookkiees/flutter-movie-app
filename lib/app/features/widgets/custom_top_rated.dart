import 'package:flutter/material.dart';
import 'package:fluttermovieapp/app/router/app_routers.dart';

import 'package:get/get.dart';

import '../../services/app_constant.dart';
import '../dashboard/dashboard_controller.dart';

class CustomTopRated extends GetView<DashboardController> {
  const CustomTopRated({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      controller.getTopRated(7);
    });

    return Obx(() => controller.isLoading.value
        ? const Visibility(visible: false, child: CircularProgressIndicator())
        : SizedBox(
            height: 235,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8, left: 16, right: 8),
                    child: GestureDetector(
                      onTap: () {
                        if (controller.topRated!.results != null) {
                          Get.toNamed(
                              '${AppRouters.detailMovie}/${controller.topRated!.results![index].id}');
                        }
                      },
                      child: SizedBox(
                        width: 120,
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                controller.topRated == null
                                    ? "https://mardizu.co.id/assets/images/client/default.png"
                                    : "${AppConstant.imageUrlOrigin}${controller.topRated!.results![index].posterPath}",
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              controller.topRated == null
                                  ? ""
                                  : controller
                                      .topRated!.results![index].originalTitle!,
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ));
  }
}
