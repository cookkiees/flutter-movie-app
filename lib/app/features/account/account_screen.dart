import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../dashboard/dashboard_controller.dart';

class AccountScreen extends GetView<DashboardController> {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('account'),
      ),
    );
  }
}
