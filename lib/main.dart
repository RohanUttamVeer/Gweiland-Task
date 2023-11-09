import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_module/view/home_page.dart';

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
      home: HomePage(),
    );
  }
}
