import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/home_page/sub/dashboard_page/sub/gift_cards_page/gift_page_controller.dart';
import 'package:flutter_ui/widgets/custom_app_bar.dart';
import 'package:flutter_ui/widgets/custom_back_button.dart';
import 'package:flutter_ui/widgets/custom_header.dart';
import 'package:flutter_ui/widgets/custom_notification_button.dart';
import 'package:get/get.dart';

class GiftPage extends StatelessWidget {
  const GiftPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GiftPageController());

    return Scaffold(
      body: DecoratedBox(
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
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                // App Bar
                const CustomAppBar(
                  firstWidget: CustomBackButton(),
                  headerWidget: CustomHeader(
                    header: 'Gift',
                    size: 22,
                  ),
                  notificationWidget: CustomNotificationButton(),
                ),

                Column(
                  children: controller.gifts.map((gift) {
                    return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(gift.image),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomHeader(
                                  header: '${gift.title} Gift',
                                  size: 20,
                                ),
                                Text(
                                  'Send ${gift.title} to your loved ones',
                                  style: const TextStyle(
                                    color: Color(0xFFA4A9AE),
                                    fontFamily: 'SP400',
                                    fontSize: 15,
                                  ),
                                ).marginOnly(top: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          'Get ',
                                          style: TextStyle(
                                            fontFamily: 'SP500',
                                            fontSize: 18,
                                            color: Color(0xFF23303B),
                                          ),
                                        ),
                                        Text(
                                          gift.cashback,
                                          style: const TextStyle(
                                            fontFamily: 'SP600',
                                            fontSize: 20,
                                            color: Color(0xFF456EFE),
                                          ),
                                        ),
                                        const Text(
                                          ' Cashback',
                                          style: TextStyle(
                                            fontFamily: 'SP500',
                                            fontSize: 18,
                                            color: Color(0xFF23303B),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 13,
                                        vertical: 7,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: const Text(
                                        'Send',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'SP500',
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ).paddingAll(20),
                          ],
                        )).paddingOnly(
                      left: 20,
                      right: 20,
                      top: 20,
                      bottom: controller.gifts.last == gift ? 20 : 0,
                    );
                  }).toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
