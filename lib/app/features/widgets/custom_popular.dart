import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../router/app_routers.dart';
import '../../services/app_constant.dart';
import '../dashboard/dashboard_controller.dart';

class CustomPopular extends GetView<DashboardController> {
  const CustomPopular({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      controller.getPopular(3);
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
                        if (controller.popular!.results != null) {
                          Get.toNamed(
                              '${AppRouters.detailMovie}/${controller.popular!.results![index].id}');
                        }
                      },
                      child: SizedBox(
                        width: 120,
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                controller.popular == null
                                    ? "https://mardizu.co.id/assets/images/client/default.png"
                                    : "${AppConstant.imageUrlOrigin}${controller.popular!.results![index].posterPath}",
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              controller.popular == null
                                  ? ""
                                  : controller
                                      .popular!.results![index].originalTitle!,
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
