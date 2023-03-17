import 'package:fluttermovieapp/app/features/dashboard/dashboard_binding.dart';
import 'package:fluttermovieapp/app/features/dashboard/dashboard_page.dart';
import 'package:get/get.dart';

import '../features/home/home_binding.dart';
import '../features/home/home_screen.dart';
import 'app_routers.dart';

class AppPages {
  static const initial = AppRouters.dashboard;

  static final routes = [
    GetPage(
      name: AppRouters.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRouters.dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),

    // GetPage(
    //   name: AppRouters.login,
    //   page: () => const LoginScreen(),
    //   binding: LoginBinding(),
    // ),
    // GetPage(
    //   name: AppRouters.register,
    //   page: () => const RegisterScreen(),
    //   binding: RegisterBinding(),
    // ),
  ];
}
