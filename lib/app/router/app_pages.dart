import 'package:fluttermovieapp/app/features/movie/movie_screen.dart/detail_movie_screen.dart';
import 'package:get/get.dart';

import '../features/dashboard/dashboard_binding.dart';
import '../features/dashboard/dashboard_page.dart';
import '../features/home/home_screen.dart';
import 'app_routers.dart';

class AppPages {
  static const initial = AppRouters.dashboard;

  static final routes = [
    GetPage(
      name: AppRouters.home,
      page: () => const HomeScreen(),
      binding: DashboardBinding(),
    ),

    GetPage(
      name: AppRouters.dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),

    GetPage(
      name: '${AppRouters.detailMovie}/:id',
      page: () => const DetailMovie(),
      binding: DashboardBinding(),
    ),
    // GetPage(
    //   name: AppRouters.register,
    //   page: () => const RegisterScreen(),
    //   binding: RegisterBinding(),
    // ),
  ];
}
