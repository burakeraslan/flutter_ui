import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/home_page/sub/dashboard_page/dashboard_page.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  RxList<Widget> pages = [
    const DashboardPage(),
    const Center(child: Text('First Empty')),
    const Center(child: Text('Second Empty')),
    const Center(child: Text('Third Empty')),
    const Center(child: Text('Fourth Empty')),
  ].obs;
  RxInt currentIndex = 0.obs;

  void updateCurrentIndex(int index) {
    currentIndex.value = index;
    update();
  }
}
