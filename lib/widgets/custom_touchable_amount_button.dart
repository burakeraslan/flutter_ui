import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/home_page/sub/dashboard_page/sub/gift_cards_page/gift_page_controller.dart';
import 'package:get/get.dart';

class CustomTouchableAmountButton extends StatelessWidget {
  final int index;

  const CustomTouchableAmountButton({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(GiftPageController());
    return GetBuilder<GiftPageController>(
      builder: (controller) {
        return InkWell(
            onTap: () {
              controller.updateAmount(controller.amountList[index], index);
            },
            child: Container(
              height: 50,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: controller.selectedAmountIndex == index ? const Color(0xFFFFFFFF) : const Color(0x30A4A9AE),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '\$ ${controller.amountList[index]}',
                style: const TextStyle(
                  color: Color(0xFF8E949A),
                  fontFamily: 'SP600',
                  fontSize: 22,
                ),
              ),
            ));
      },
    );
  }
}
