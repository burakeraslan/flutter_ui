import 'package:flutter/material.dart';
import 'package:flutter_ui/core/assets.dart';
import 'package:flutter_ui/pages/home_page/sub/dashboard_page/sub/gift_cards_page/gift_page_controller.dart';
import 'package:flutter_ui/widgets/custom_app_bar.dart';
import 'package:flutter_ui/widgets/custom_back_button.dart';
import 'package:flutter_ui/widgets/custom_header.dart';
import 'package:flutter_ui/widgets/custom_notification_button.dart';
import 'package:flutter_ui/widgets/custom_text_input.dart';
import 'package:flutter_ui/widgets/custom_touchable_amount_button.dart';
import 'package:get/get.dart';

class GiftPage extends StatelessWidget {
  const GiftPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GiftPageController());

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFEEEEEE),
            ],
          ),
        ),
        child: GetBuilder<GiftPageController>(builder: (controller) {
          return SafeArea(
            child: Column(
              children: [
                // App Bar
                const CustomAppBar(
                  prefixWidget: CustomBackButton(),
                  centreWidget: CustomHeader(
                    header: 'Gift',
                    size: 22,
                  ),
                  suffixWidget: CustomNotificationButton(),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: controller.gifts.map((gift) {
                        return Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(gift.image),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomHeader(
                                        header: '${gift.title} Gift',
                                        size: 20,
                                      ),
                                      Text(
                                        'Send ${gift.title} to your loved ones',
                                        style: const TextStyle(
                                          color: Color(0xFFA4A9AE),
                                          fontFamily: 'SP400',
                                          fontSize: 15,
                                        ),
                                      ).marginOnly(top: 5),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Text(
                                                'Get ',
                                                style: TextStyle(
                                                  fontFamily: 'SP500',
                                                  fontSize: 18,
                                                  color: Color(0xFF23303B),
                                                ),
                                              ),
                                              Text(
                                                gift.cashback,
                                                style: const TextStyle(
                                                  fontFamily: 'SP600',
                                                  fontSize: 20,
                                                  color: Color(0xFF456EFE),
                                                ),
                                              ),
                                              const Text(
                                                ' Cashback',
                                                style: TextStyle(
                                                  fontFamily: 'SP500',
                                                  fontSize: 18,
                                                  color: Color(0xFF23303B),
                                                ),
                                              ),
                                            ],
                                          ),
                                          if (!gift.isSelect)
                                            InkWell(
                                              onTap: () {
                                                controller.selectGift(controller.gifts.indexOf(gift));
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                padding: const EdgeInsets.symmetric(
                                                  horizontal: 13,
                                                  vertical: 7,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: const Color(0xFF456EFE),
                                                  borderRadius: BorderRadius.circular(5),
                                                ),
                                                child: const Text(
                                                  'Send',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'SP500',
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      )
                                    ],
                                  ).paddingAll(20),
                                ],
                              ),
                            ),
                            if (gift.isSelect)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CustomHeader(
                                    header: 'Add Recipient Bank Detail',
                                    size: 19,
                                  ).paddingSymmetric(vertical: 10),
                                  CustomTextInput(
                                    hintText: 'Name',
                                    focusNode: controller.nameInputFocusNode,
                                    isFocus: controller.nameInputFocus,
                                    // isFocus: controller.nameInputFocusNode.hasFocus,
                                  ).paddingSymmetric(vertical: 5),
                                  CustomTextInput(
                                    hintText: 'Enter Account Number',
                                    focusNode: controller.accountNumberInputFocusNode,
                                    isFocus: controller.accountNumberInputFocus,
                                  ).paddingSymmetric(vertical: 5),
                                  CustomTextInput(
                                    hintText: 'Reciever’s Mobile Number',
                                    focusNode: controller.recieverNumberInputFocusNode,
                                    isFocus: controller.recieverNumberInputFocus,
                                  ).paddingSymmetric(vertical: 5),
                                  CustomTextInput(
                                    hintText: 'Purpose of payment (Optional)',
                                    focusNode: controller.purposeInputFocusNode,
                                    isFocus: controller.purposeInputFocus,
                                  ).paddingSymmetric(vertical: 5),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: SizedBox(
                                          height: 50,
                                          child: TextField(
                                            style: const TextStyle(
                                              fontFamily: 'SP400',
                                              fontSize: 17,
                                              color: Colors.black,
                                            ),
                                            focusNode: controller.passwordInputFocusNode,
                                            obscureText: controller.obscureText,
                                            decoration: InputDecoration(
                                                hintText: 'Password',
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
                                                fillColor: controller.passwordInputFocus ? Colors.white : const Color(0x30A4A9AE),
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
                                                suffixIcon: IconButton(
                                                  onPressed: () {
                                                    controller.updateObscureText();
                                                  },
                                                  icon: controller.obscureText ? const Icon(Icons.visibility_off_outlined) : const Icon(Icons.visibility_outlined),
                                                  color: const Color(0xFF8E949A),
                                                )),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: const Color(0x30A4A9AE),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Image.asset(PngImages.fingerPrint),
                                        ).paddingOnly(left: 10),
                                      )
                                    ],
                                  ).paddingSymmetric(vertical: 5),
                                  const CustomHeader(
                                    header: 'Enter Amount',
                                    size: 19,
                                  ).paddingSymmetric(vertical: 10),
                                  TextField(
                                    controller: controller.amountController,
                                    focusNode: controller.amountInputFocusNode,
                                    style: const TextStyle(
                                      fontFamily: 'SP600',
                                      fontSize: 22,
                                      color: Color(0xFF456EFE),
                                    ),
                                    decoration: InputDecoration(
                                      hintText: 'Amount',
                                      hintStyle: const TextStyle(
                                        fontFamily: 'SP400',
                                        fontSize: 22,
                                        color: Color(0xFF8E949A),
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: const EdgeInsets.all(20),
                                      filled: true,
                                      fillColor: controller.amountInputFocus ? Colors.white : const Color(0x30A4A9AE),
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
                                    textAlign: TextAlign.center,
                                  ).paddingSymmetric(vertical: 10),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: const CustomTouchableAmountButton(
                                          index: 0,
                                        ).paddingOnly(
                                          top: 5,
                                          bottom: 5,
                                          right: 10,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: const CustomTouchableAmountButton(
                                          index: 1,
                                        ).paddingSymmetric(vertical: 5),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: const CustomTouchableAmountButton(
                                          index: 2,
                                        ).paddingOnly(
                                          top: 5,
                                          bottom: 5,
                                          left: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const CustomHeader(
                                    header: 'Enter Gift Message',
                                    size: 19,
                                  ).paddingSymmetric(vertical: 10),
                                  TextField(
                                    maxLines: 5,
                                    keyboardType: TextInputType.multiline,
                                    focusNode: controller.messageInputFocusNode,
                                    style: const TextStyle(
                                      fontFamily: 'SP400',
                                      fontSize: 17,
                                      color: Colors.black,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: 'Type your message here..',
                                      hintStyle: const TextStyle(
                                        fontFamily: 'SP400',
                                        fontSize: 17,
                                        color: Color(0xFF8E949A),
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: const EdgeInsets.all(20),
                                      filled: true,
                                      fillColor: controller.messageInputFocus ? Colors.white : const Color(0x30A4A9AE),
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
                                  ).paddingSymmetric(vertical: 10),
                                  InkWell(
                                    onTap: () {
                                      controller.selectGift(controller.gifts.indexOf(gift));
                                    },
                                    child: Container(
                                      height: 50,
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(vertical: 15),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF456EFE),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: const Text(
                                        'Send',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'SP500',
                                          fontSize: 16,
                                        ),
                                      ),
                                    ).paddingSymmetric(
                                      horizontal: 50,
                                      vertical: 10,
                                    ),
                                  ),
                                ],
                              ).paddingSymmetric(vertical: 5),
                          ],
                        ).paddingOnly(
                          left: 20,
                          right: 20,
                          top: 20,
                          bottom: controller.gifts.last == gift ? 20 : 0,
                        );
                      }).toList(),
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
