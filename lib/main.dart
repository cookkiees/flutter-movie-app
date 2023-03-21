import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/router/app_pages.dart';
import 'app/services/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      initialBinding: ApiServiceBinding(),
    );
  }
}
