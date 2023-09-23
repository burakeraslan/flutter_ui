import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui/pages/home_page/sub/dashboard_page/dashboard_page_controller.dart';
import 'package:get/get.dart';

class ServicesCustomWidget extends StatelessWidget {
  const ServicesCustomWidget({
    super.key,
    required this.controller,
  });

  final DashboardPageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Services',
          style: TextStyle(
            fontFamily: 'SP600',
            fontSize: 20,
            color: Color(0xFF23303B),
          ),
        ).paddingAll(20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: controller.services.map((service) {
              return Column(
                children: [
                  Container(
                    width: 75,
                    height: 75,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color.fromARGB(50, 164, 169, 174),
                    ),
                    child: Center(
                      child: SvgPicture.asset(service.icon),
                    ),
                  ),
                  Text(
                    service.title,
                    style: const TextStyle(fontSize: 13, fontFamily: 'SP600', color: Color(0xFF8E949A)),
                  ).marginOnly(top: 10),
                ],
              ).paddingOnly(
                left: service == controller.services.first ? 20 : 0,
                right: service == controller.services.last ? 20 : 10,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
