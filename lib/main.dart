import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_module/bindings/home_binding.dart';
import 'home_module/view/pages/bottom_nav.dart';

void main() {
  runApp(const GweilandTask());
}

class GweilandTask extends StatelessWidget {
  const GweilandTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gweiland Task',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      initialBinding: HomeBinding(),
      home: HomeNav(),
    );
  }
}
