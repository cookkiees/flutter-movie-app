import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/app_constants.dart';
import '../home/home_controller.dart';

class CustomListView extends GetView<HomeController> {
  const CustomListView(
    this.future, {
    super.key,
  });
  final Future future;
  @override
  Widget build(BuildContext context) {
    future;
    return SizedBox(
      height: 235,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 7,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 120,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        controller.dataMovie == null
                            ? "https://mardizu.co.id/assets/images/client/default.png"
                            : "${AppConstant.imageUrlOrigin}${controller.dataMovie!.results![index].posterPath}",
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      controller.dataMovie == null
                          ? ""
                          : controller
                              .dataMovie!.results![index].originalTitle!,
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis, color: Colors.white),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
