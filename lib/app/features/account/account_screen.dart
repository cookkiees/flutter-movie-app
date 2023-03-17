import 'package:flutter/material.dart';
import 'package:fluttermovieapp/app/features/home/home_controller.dart';
import 'package:get/get.dart';

class AccountScreen extends GetView<HomeController> {
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
