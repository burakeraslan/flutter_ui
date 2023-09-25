import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui/core/assets.dart';
import 'package:flutter_ui/pages/home_page/sub/dashboard_page/dashboard_page_controller.dart';
import 'package:flutter_ui/pages/home_page/sub/dashboard_page/sub/gift_cards_page/gift_page.dart';
import 'package:flutter_ui/widgets/custom_app_bar.dart';
import 'package:flutter_ui/widgets/custom_credit_card.dart';
import 'package:flutter_ui/widgets/custom_header.dart';
import 'package:flutter_ui/widgets/custom_notification_button.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

extension StringLimitExtension on String {
  String limit(int limit) {
    if (length > limit) {
      return '${substring(0, limit)}...';
    }
    return this;
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardPageController());

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

        // Screen
        child: GetBuilder<DashboardPageController>(builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Custom App Bar
              CustomAppBar(
                prefixWidget: InkWell(
                  onTap: () {
                    print('Clicked on user profile');
                  },
                  child: Image.asset(
                    PngImages.userPp,
                    width: 45,
                    height: 45,
                  ),
                ),
                centreWidget: const CustomHeader(header: 'Fintech', size: 26),
                suffixWidget: const CustomNotificationButton(),
              ),

              Expanded(
                  child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // Cards and Dots
                    Column(
                      children: [
                        CarouselSlider.builder(
                          itemCount: controller.userData.length,
                          options: CarouselOptions(
                            height: 220,
                            padEnds: true,
                            enableInfiniteScroll: false,
                            viewportFraction: 0.9,
                            onPageChanged: (index, reason) {
                              controller.updateSelectedCard(index);
                            },
                          ),
                          itemBuilder: (context, index, realIndex) {
                            final userData = controller.userData[index];
                            return CustomCreditCard(userData: userData).paddingSymmetric(horizontal: 5);
                          },
                        ).paddingOnly(top: 10),
                        AnimatedSmoothIndicator(
                          activeIndex: controller.selectedCard.value,
                          count: controller.userData.length,
                          effect: const ExpandingDotsEffect(
                            activeDotColor: Color(0xFF456EFE),
                            dotColor: Color(0x50A4A9AE),
                            dotHeight: 8,
                            dotWidth: 8,
                            expansionFactor: 2,
                          ),
                        ).paddingOnly(top: 10),
                      ],
                    ),

                    // Quick Actions
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomHeader(
                          header: 'Quick Actions',
                          size: 20,
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
                    ),

                    // Services
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomHeader(
                          header: 'Services',
                          size: 20,
                        ).paddingAll(20),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          child: Row(
                            children: controller.services.map((service) {
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      if (service.title == 'Gifts') {
                                        Get.to(() => const GiftPage());
                                      }
                                    },
                                    child: Container(
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
                                  ),
                                  Text(
                                    service.title,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'SP600',
                                      color: Color(0xFF8E949A),
                                    ),
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
                    ),

                    // Schedule Payments
                    Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomHeader(
                              header: 'Schedule Payments',
                              size: 20,
                            ),
                            Text(
                              'View All',
                              style: TextStyle(
                                fontFamily: 'SP500',
                                fontSize: 14,
                                color: Color(0xFFA4A9AE),
                              ),
                            ),
                          ],
                        ).paddingOnly(bottom: 20),
                        Column(
                          children: controller.schedulePayments.map((payment) {
                            return Container(
                              width: double.maxFinite,
                              // height: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(payment.icon).paddingAll(20),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            payment.title.limit(20),
                                            style: const TextStyle(
                                              fontFamily: 'SP500',
                                              fontSize: 16,
                                              color: Color(0xFF23303B),
                                            ),
                                          ).marginOnly(bottom: 10),
                                          Row(
                                            children: [
                                              const Text(
                                                'Next Payment:',
                                                style: TextStyle(
                                                  fontFamily: 'SP600',
                                                  fontSize: 14,
                                                  color: Color(0xFFA4A9AE),
                                                ),
                                              ),
                                              Text(
                                                payment.paymentDate,
                                                style: const TextStyle(
                                                  fontFamily: 'SP600',
                                                  fontSize: 14,
                                                  color: Color(0xFF456EFE),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ).paddingSymmetric(vertical: 20),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        payment.paymentAmount.limit(6),
                                        style: const TextStyle(
                                          fontFamily: 'SP600',
                                          fontSize: 20,
                                          color: Color(0xFF23303B),
                                        ),
                                      ),
                                      const Text(
                                        'USD',
                                        style: TextStyle(
                                          fontFamily: 'SP600',
                                          fontSize: 9,
                                          color: Color(0xFFA4A9AE),
                                        ),
                                      ),
                                    ],
                                  ).paddingAll(20)
                                ],
                              ),
                            ).paddingOnly(
                              bottom: payment == controller.schedulePayments.last ? 0 : 10,
                            );
                          }).toList(),
                        )
                      ],
                    ).paddingAll(20),
                  ],
                ),
              ))
            ],
          );
        }),
      ),
    ));
  }
}
