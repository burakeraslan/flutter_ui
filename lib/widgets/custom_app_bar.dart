import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  final Widget firstWidget;
  final Widget headerWidget;
  final Widget notificationWidget;

  const CustomAppBar({
    super.key,
    required this.firstWidget,
    required this.headerWidget,
    required this.notificationWidget,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          firstWidget,
          headerWidget,
          notificationWidget,
        ],
      ),
    ).paddingSymmetric(horizontal: 20);
  }
}
