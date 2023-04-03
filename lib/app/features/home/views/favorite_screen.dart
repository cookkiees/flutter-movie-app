import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../dashboard/dashboard_controller.dart';

class FavoriteScreen extends GetView<DashboardController> {
  const FavoriteScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () async {});

    return Scaffold(
        appBar: AppBar(),
        body: GetBuilder<DashboardController>(builder: (index) {
          return ListView.builder(itemBuilder: (context, index) {
            return const Text("");
          });
        }));
  }
}
