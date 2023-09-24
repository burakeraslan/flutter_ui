import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui/core/assets.dart';
import 'package:flutter_ui/pages/home_page/sub/dashboard_page/dashboard_page_controller.dart';
import 'package:flutter_ui/pages/home_page/sub/dashboard_page/sub/gift_cards_page/gift_page.dart';
import 'package:flutter_ui/widgets/custom_app_bar.dart';
import 'package:flutter_ui/widgets/custom_header.dart';
import 'package:flutter_ui/widgets/custom_notification_button.dart';
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

        // Screen
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Custom App Bar
              CustomAppBar(
                firstWidget: InkWell(
                  onTap: () {
                    print('Clicked on user profile');
                  },
                  child: Image.asset(
                    PngImages.userPp,
                    width: 45,
                    height: 45,
                  ),
                ),
                headerWidget: const CustomHeader(header: 'Fintech', size: 26),
                notificationWidget: const CustomNotificationButton(),
              ),

              // Credit Cards
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
                                  {
                                    Get.to(() => const GiftPage());
                                  }
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
                                      payment.title,
                                      style: const TextStyle(
                                        fontFamily: 'SP500',
                                        fontSize: 16,
                                        color: Color(0xFF23303B),
                                      ),
                                    ).marginOnly(bottom: 10),
                                    Row(
                                      children: [
                                        const Text('Next Payment:',
                                            style: TextStyle(
                                              fontFamily: 'SP600',
                                              fontSize: 14,
                                              color: Color(0xFFA4A9AE),
                                            )),
                                        Text(payment.paymentDate,
                                            style: const TextStyle(
                                              fontFamily: 'SP600',
                                              fontSize: 14,
                                              color: Color(0xFF456EFE),
                                            ))
                                      ],
                                    )
                                  ],
                                ).paddingSymmetric(vertical: 20),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  payment.paymentAmount,
                                  style: const TextStyle(
                                    fontFamily: 'SP600',
                                    fontSize: 20,
                                    color: Color(0xFF23303B),
                                  ),
                                ),
                                const Text('USD',
                                    style: TextStyle(
                                      fontFamily: 'SP600',
                                      fontSize: 9,
                                      color: Color(0xFFA4A9AE),
                                    )),
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
        ),
      ),
    ));
  }
}
