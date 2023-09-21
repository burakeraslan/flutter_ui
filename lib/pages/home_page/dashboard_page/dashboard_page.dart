import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui/core/assets.dart';
import 'package:flutter_ui/pages/home_page/dashboard_page/dashboard_page_controller.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardPageController());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Header(),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: (MediaQuery.of(context).size.width - 60) * 0.63,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.userData.length,
              itemBuilder: (context, index) => Container(
                width: (MediaQuery.of(context).size.width - 60),
                margin: EdgeInsets.only(
                  left: index == 0 ? 20 : 0,
                  right: index == controller.userData.length - 1 ? 20 : 10,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: [
                      Color.fromARGB(
                        controller.userData[index]['first_a'],
                        controller.userData[index]['r'],
                        controller.userData[index]['g'],
                        controller.userData[index]['b'],
                      ),
                      Color.fromARGB(
                        controller.userData[index]['second_a'],
                        controller.userData[index]['r'],
                        controller.userData[index]['g'],
                        controller.userData[index]['b'],
                      ),
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
                              '\$${controller.userData[index]['balance']}',
                              style: const TextStyle(
                                fontFamily: 'SP500',
                                fontSize: 28,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              controller.userData[index]['cent'],
                              style: const TextStyle(
                                fontFamily: 'SP500',
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ).marginSymmetric(vertical: 10),
                        Text(
                          controller.userData[index]['card_no'],
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
                              controller.userData[index]['valid_from'],
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
                              controller.userData[index]['valid_thru'],
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
                          controller.userData[index]['card_holder'],
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
                      children: [
                        SvgPicture.asset(
                          SvgIcons.chip,
                        ),
                        Image.asset(
                          PngImages.card,
                          width: 36,
                          height: 22,
                        ),
                      ],
                    ),
                  ],
                ).paddingAll(30),
              ),
            ),
          ).paddingOnly(top: 20),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                print("Clicked on user profile");
              },
              child: Image.asset(
                PngImages.userPp,
                width: 45,
                height: 45,
              ),
            ),
            const Text(
              "Fintech",
              style: TextStyle(
                fontFamily: 'SP600',
                fontSize: 26,
                color: Color(0xFF23303B),
              ),
            ),
            Stack(
              children: [
                InkWell(
                  onTap: () {
                    print("Clicked on notification icon");
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0x40A4A9AE),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: SvgPicture.asset(
                      SvgIcons.notifications,
                      colorFilter: const ColorFilter.mode(Color(0xFFA3A8AC), BlendMode.srcIn),
                    ),
                  ),
                ),
                Positioned(
                  right: 12,
                  top: 13.5,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            )
          ],
        )).paddingSymmetric(horizontal: 20);
  }
}
