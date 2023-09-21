import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui/core/assets.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
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
                          padding: const EdgeInsets.all(7),
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
                        right: 11,
                        top: 13,
                        child: Container(
                          width: 7,
                          height: 7,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
