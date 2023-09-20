import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/home_page/dashboard_page/gift_cards_page/dashboard_page.dart';
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
}
