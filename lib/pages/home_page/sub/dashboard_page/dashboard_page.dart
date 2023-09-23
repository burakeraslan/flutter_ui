import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui/core/assets.dart';
import 'package:flutter_ui/pages/home_page/sub/dashboard_page/dashboard_page_controller.dart';
import 'package:flutter_ui/widgets/header.dart';
import 'package:flutter_ui/widgets/quick_actions.dart';
import 'package:flutter_ui/widgets/schedule_payment.dart';
import 'package:flutter_ui/widgets/services_custom_widget.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardPageController());

    return Scaffold(
        body: SafeArea(
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFEEEEEE),
            ],
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Header(),

              // credit cards
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                    children: controller.userData.map((userData) {
                  return Container(
                    width: (MediaQuery.of(context).size.width - 60),
                    height: (MediaQuery.of(context).size.width - 60) * 0.63,
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
                          mainAxisAlignment: MainAxisAlignment.center,
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
              ),

              // for now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 5,
                    height: 5,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ).marginSymmetric(horizontal: 2),
                  Container(
                    width: 5,
                    height: 5,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ).marginSymmetric(horizontal: 2),
                  Container(
                    width: 5,
                    height: 5,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ).marginSymmetric(horizontal: 2),
                ],
              ).marginOnly(top: 10),

              QuickActions(controller: controller),
              ServicesCustomWidget(controller: controller),
              SchedulePayment(controller: controller).paddingAll(20),
            ],
          ),
        ),
      ),
    ));
  }
}
