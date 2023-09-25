import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui/core/assets.dart';
import 'package:flutter_ui/pages/home_page/home_page_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageController());

    return GetBuilder<HomePageController>(
      builder: (controller) {
        return Scaffold(
          body: controller.pages[controller.currentIndex.value],
          bottomNavigationBar: Stack(
            children: [
              BottomNavigationBar(
                currentIndex: controller.currentIndex.value,
                onTap: (index) {
                  controller.updateCurrentIndex(index);
                },
                backgroundColor: const Color(0xFFF9F9FB),
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      SvgIcons.home,
                      colorFilter: const ColorFilter.mode(Color(0xFF8E949A), BlendMode.srcIn),
                      height: 22,
                      width: 22,
                    ),
                    activeIcon: SvgPicture.asset(
                      SvgIcons.home,
                      colorFilter: const ColorFilter.mode(Color(0xFF466EFA), BlendMode.srcIn),
                      height: 22,
                      width: 22,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      SvgIcons.first,
                      colorFilter: const ColorFilter.mode(Color(0xFF8E949A), BlendMode.srcIn),
                      height: 22,
                      width: 22,
                    ),
                    activeIcon: SvgPicture.asset(
                      SvgIcons.first,
                      colorFilter: const ColorFilter.mode(Color(0xFF466EFA), BlendMode.srcIn),
                      height: 22,
                      width: 22,
                    ),
                    label: 'First Empty',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      SvgIcons.second,
                      colorFilter: const ColorFilter.mode(Color(0xFF8E949A), BlendMode.srcIn),
                      height: 22,
                      width: 22,
                    ),
                    activeIcon: SvgPicture.asset(
                      SvgIcons.second,
                      colorFilter: const ColorFilter.mode(Color(0xFF466EFA), BlendMode.srcIn),
                      height: 22,
                      width: 22,
                    ),
                    label: 'Second Empty',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      SvgIcons.third,
                      colorFilter: const ColorFilter.mode(Color(0xFF8E949A), BlendMode.srcIn),
                      height: 22,
                      width: 22,
                    ),
                    activeIcon: SvgPicture.asset(
                      SvgIcons.third,
                      colorFilter: const ColorFilter.mode(Color(0xFF466EFA), BlendMode.srcIn),
                      height: 22,
                      width: 22,
                    ),
                    label: 'Third Empty',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      SvgIcons.fourth,
                      colorFilter: const ColorFilter.mode(Color(0xFF8E949A), BlendMode.srcIn),
                      height: 22,
                      width: 22,
                    ),
                    activeIcon: SvgPicture.asset(
                      SvgIcons.fourth,
                      colorFilter: const ColorFilter.mode(Color(0xFF466EFA), BlendMode.srcIn),
                      height: 22,
                      width: 22,
                    ),
                    label: 'Fourth Empty',
                  ),
                ],
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
              ),
              Positioned(
                left:
                    MediaQuery.of(context).size.width / controller.pages.length * controller.currentIndex.value + (MediaQuery.of(context).size.width / controller.pages.length - 22) / 2,
                width: 22,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  height: 1,
                  curve: Curves.easeInOut,
                  decoration: const BoxDecoration(
                    color: Color(0xFF466EFA),
                  ),
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).padding.bottom + 10,
                left: MediaQuery.of(context).size.width / controller.pages.length * controller.currentIndex.value +
                    (MediaQuery.of(context).size.width / controller.pages.length - 5.6) / 2,
                width: 2.85,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  height: 2.85,
                  curve: Curves.easeInOut,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF466EFA),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
