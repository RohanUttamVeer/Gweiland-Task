import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(),
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              Text('hy'),
            ],
          ),
        ),
      ),
    );
  }
}