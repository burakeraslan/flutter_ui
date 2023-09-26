import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  final Widget prefixWidget;
  final Widget centreWidget;
  final Widget suffixWidget;

  const CustomAppBar({
    super.key,
    required this.prefixWidget,
    required this.centreWidget,
    required this.suffixWidget,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          prefixWidget,
          centreWidget,
          suffixWidget,
        ],
      ),
    ).paddingOnly(
      left: 20,
      right: 20,
    );
  }
}
