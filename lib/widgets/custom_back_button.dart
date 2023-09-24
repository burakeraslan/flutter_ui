import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui/core/assets.dart';
import 'package:get/get.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: Container(
        width: 45,
        height: 45,
        padding: const EdgeInsets.all(13),
        decoration: const BoxDecoration(
          color: Color(0x40A4A9AE),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          SvgIcons.back,
          colorFilter: const ColorFilter.mode(Color(0xFFA3A8AC), BlendMode.srcIn),
        ),
      ),
    );
  }
}
