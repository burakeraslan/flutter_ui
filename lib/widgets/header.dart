import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui/core/assets.dart';
import 'package:get/get.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                print('Clicked on user profile');
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
                    print('Clicked on notification icon');
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Color(0x40A4A9AE),
                      shape: BoxShape.circle,
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
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            )
          ],
        )).paddingSymmetric(horizontal: 20);
  }
}
