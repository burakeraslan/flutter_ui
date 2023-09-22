import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/home_page/sub/dashboard_page/dashboard_page_controller.dart';
import 'package:get/get.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({
    super.key,
    required this.controller,
  });

  final DashboardPageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quick Actions',
          style: TextStyle(
            fontFamily: 'SP600',
            fontSize: 20,
            color: Color(0xFF23303B),
          ),
        ).paddingAll(20),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
              children: controller.quickActions.map(
            (quickAction) {
              return Container(
                width: 140,
                height: 140,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: quickAction.color,
                      ),
                      child: Center(
                          child: Image.asset(
                        quickAction.icon,
                        width: 22,
                        height: 22,
                      )),
                    ),
                    Text(
                      quickAction.title,
                      style: const TextStyle(
                        fontFamily: 'SP600',
                        fontSize: 16,
                        color: Color(0xFF202A34),
                      ),
                    ).marginOnly(top: 20),
                  ],
                ),
              ).paddingOnly(
                left: quickAction == controller.quickActions.first ? 20 : 0,
                right: quickAction == controller.quickActions.last ? 20 : 10,
              );
            },
          ).toList()),
        )
      ],
    );
  }
}
