import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/home_page/sub/dashboard_page/dashboard_page_controller.dart';
import 'package:get/get.dart';

class SchedulePayment extends StatelessWidget {
  const SchedulePayment({
    super.key,
    required this.controller,
  });

  final DashboardPageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Schedule Payments',
              style: TextStyle(
                fontFamily: 'SP600',
                fontSize: 20,
                color: Color(0xFF23303B),
              ),
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
    );
  }
}
