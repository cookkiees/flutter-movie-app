import 'package:fluttermovieapp/app/features/dashboard/dashboard_controller.dart';
import 'package:fluttermovieapp/app/features/dashboard/dashboard_interactor.dart';

import 'package:get/get.dart';

import '../../services/api_service.dart';
import 'dashboard_worker.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ApiService());
    Get.put(DashboardWorker());
    Get.put(DashboardInteractor());
    Get.put(DashboardController());
  }
}
