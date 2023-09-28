import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/home_page/sub/dashboard_page/sub/gift_cards_page/gift_page_controller.dart';
import 'package:get/get.dart';

class CustomTextInput extends StatelessWidget {
  final String hintText;
  final FocusNode focusNode;
  final bool isFocus;

  const CustomTextInput({
    super.key,
    required this.hintText,
    required this.focusNode,
    required this.isFocus,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(GiftPageController());
    return GetBuilder<GiftPageController>(builder: (controller) {
      return SizedBox(
        height: 50,
        child: TextField(
          style: const TextStyle(
            fontFamily: 'SP400',
            fontSize: 17,
            color: Colors.black,
          ),
          focusNode: focusNode,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              fontFamily: 'SP400',
              fontSize: 17,
              color: Color(0xFF8E949A),
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10,
              bottom: 10,
            ),
            filled: true,
            fillColor: isFocus ? Colors.white : const Color(0x30A4A9AE),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xFF456EFE),
                width: 1,
              ),
            ),
          ),
        ),
      );
    });
  }
}
