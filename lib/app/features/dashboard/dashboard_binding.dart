import 'package:get/get.dart';

import '../home/home_controller.dart';
import 'dashboard_controller.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(DashboardController());
  }
}
