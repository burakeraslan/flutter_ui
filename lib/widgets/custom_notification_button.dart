import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui/core/assets.dart';

class CustomNotificationButton extends StatelessWidget {
  const CustomNotificationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            // print('Clicked on notification icon');
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
    );
  }
}
