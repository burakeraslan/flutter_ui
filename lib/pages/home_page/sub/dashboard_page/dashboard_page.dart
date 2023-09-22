import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui/core/assets.dart';
import 'package:flutter_ui/pages/home_page/sub/dashboard_page/dashboard_page_controller.dart';
import 'package:flutter_ui/widgets/header.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardPageController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Header(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: controller.userData.map((userData) {
                return Container(
                  width: (MediaQuery.of(context).size.width - 60),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      colors: [
                        userData.firstColor,
                        userData.secondColor,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Available Balance',
                            style: TextStyle(
                              fontFamily: 'SP400',
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '\$${userData.balance}',
                                style: const TextStyle(
                                  fontFamily: 'SP500',
                                  fontSize: 28,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                userData.cent,
                                style: const TextStyle(
                                  fontFamily: 'SP500',
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ).marginSymmetric(vertical: 10),
                          Text(
                            userData.cardNo,
                            style: const TextStyle(
                              fontFamily: 'SP500',
                              fontSize: 19,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              const Text(
                                'Valid From',
                                style: TextStyle(
                                  fontFamily: 'SP400',
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ).marginOnly(right: 5),
                              Text(
                                userData.validFrom,
                                style: const TextStyle(
                                  fontFamily: 'SP500',
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ).marginOnly(right: 10),
                              const Text(
                                'Valid Thru',
                                style: TextStyle(
                                  fontFamily: 'SP400',
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ).marginOnly(right: 5),
                              Text(
                                userData.validThru,
                                style: const TextStyle(
                                  fontFamily: 'SP500',
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ).marginOnly(right: 10),
                            ],
                          ).marginSymmetric(vertical: 10),
                          const Text(
                            'Card Holder',
                            style: TextStyle(
                              fontFamily: 'SP400',
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ).marginOnly(top: 10, bottom: 5),
                          Text(
                            userData.cardHolder,
                            style: const TextStyle(
                              fontFamily: 'SP600',
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            SvgIcons.chip,
                          ),
                          Image.asset(
                            PngImages.card,
                          ),
                        ],
                      ),
                    ],
                  ).paddingAll(30),
                ).paddingOnly(
                  top: 20,
                  left: userData == controller.userData.first ? 20 : 0,
                  right: userData == controller.userData.last ? 20 : 10,
                  // bottom: 10,
                );
              }).toList()),
            )
          ],
        ),
      ),
    );
  }
}
